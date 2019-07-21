import multiprocessing as mp
import os
import os.path
from contextlib import contextmanager
from typing import Tuple


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


def process_image(info: Tuple[str, str, str]):
    image, tag, path = info
    username = os.environ["DOCKER_USERNAME"]
    travis_tag = os.environ["TRAVIS_TAG"]

    docker_file_path = os.path.join(path, "Dockerfile")
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

    with docker_login(username, password):
        pool = mp.Pool(5)
        # image, tag, path
        pool.imap_unordered(process_image, get_images("."))


main()
