import os
import os.path
from contextlib import contextmanager


def execute(command: str):
    with open("./build.sh", "a") as f:
        f.write(f"{command}\n")


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
    docker_file_path = os.path.join(path, "Dockerfile")
    full_image_name = f"$DOCKER_USERNAME/{image}:{tag}-$TRAVIS_TAG"
    short_image_name = f"$DOCKER_USERNAME/{image}:{tag}"
    execute(
        f'docker build --rm -f "{docker_file_path}" -t "{full_image_name}" "{path}"'
    )
    execute(f'docker tag "{full_image_name}" "{short_image_name}"')

    execute(f"docker push {full_image_name}")
    execute(f"docker push {short_image_name}")


def process_image(image: str, image_path: str):
    execute(f"# {image}")
    print(f"Processing image {image}")
    for tag, path in get_tags(image_path):
        process_image_tag(image, tag, path)
    execute("")


@contextmanager
def docker_login(username: str, password: str):
    try:
        execute(f"docker login -u {username} -p {password}")
        yield
    finally:
        execute(f"docker logout")


def main():
    try:
        os.remove("./build.sh")
    except BaseException:
        pass

    with docker_login("$DOCKER_USERNAME", "$DOCKER_PASSWORD"):
        for image, image_path in get_images("."):
            process_image(image, image_path)


if __name__ == "__main__":
    main()
