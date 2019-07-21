import multiprocessing as mp
import os
import os.path
from contextlib import contextmanager


def get_directories(original_path: str):
    for path in os.listdir(original_path):
        if not os.path.isdir(os.path.join(original_path, path)):
            continue

        yield path


def get_tags(path: str, directory: str):
    for tag in get_directories(os.path.join(path, directory)):
        yield tag, os.path.join(path, directory, tag)


def get_images(path: str):
    for image in get_directories("."):
        if image.startswith("."):
            continue

        for tag, path in get_tags(".", image):
            yield image, tag, path


def process_image(image: str, tag: str, path: str, username: str, travis_tag: str):
    docker_file_path = os.path(path, "Dockerfile")
    full_image_name = f"{username}/{image}:{tag}-{travis_tag}"
    short_image_name = f"{username}/{image}:{tag}"
    os.system(
        f'docker build --rm -f "{docker_file_path}" -t "{full_image_name}" "{path}"'
    )
    os.system(f'docker tag "{full_image_name}" "{short_image_name}"')

    os.system(f"docker push {full_image_name}")
    os.system(f"docker push {short_image_name}")


@contextmanager
def docker_login(username: str, password: str):
    try:
        os.system(f"docker login -u {username} -p {password}")
        yield
    finally:
        os.system(f"docker logout")


def main():
    username = os.environ["DOCKER_USERNAME"]
    password = os.environ["DOCKER_PASSWORD"]
    travis_tag = os.environ["TRAVIS_TAG"]

    with docker_login(username, password):
        pool = mp.Pool(5)
        # image, tag, path
        pool.map(
            lambda info: process_image(info[0], info[1], info[2], username, travis_tag),
            get_images("."),
        )
