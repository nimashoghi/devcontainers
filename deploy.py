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


def get_tags(image_path: str):
    for tag in get_directories(image_path):
        yield tag, os.path.join(image_path, tag)


def get_images(path: str):
    for image in get_directories(path):
        if image.startswith("."):
            continue

        yield image, os.path.join(path, image)


def process_image_tag(image: str, tag: str, path: str):
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


def process_image(image: str, image_path: str):
    print(f"Processing {image}")
    for tag, path in get_tags(image_path):
        process_image_tag(image, tag, path)


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
        with mp.Pool(processes=5) as pool:
            # image, tag, path
            pool.starmap(process_image, list(get_images(".")))


if __name__ == "__main__":
    main()
