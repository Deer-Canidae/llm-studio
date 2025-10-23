# LLM Studio

LLM Studio aims to provide a preconfigured local-only deployment of LLM tooling.

## About LLM Studio

LLM Studio is a compose deployment including [Ollama](https://ollama.com/) and [open-webui](https://github.com/open-webui/open-webui)
which aims to provide a turn-key experience with LLM assisted workflow.

LLM Studio focusses on a offline by default workflow.
Using the default configuration, your data and conversations never leave your machine.
This allows you to keep working offline and in complete privacy.

## Running LLM Studio

### Requirements

LLM studio requires [docker-compose](https://docs.docker.com/compose/install/)
or [podman-compose](https://github.com/containers/podman-compose)
to be installed to operate.

### Starting up LLM Studio

To start LLM studio, run:

```sh
docker compose up -d --build
```

Or if you're using podman-compose:

```sh
podman-compose up -d --build
```

Once the process will have initialized, you may access
your personal studio at [localhost:4000](http://localhost:4000) !

## Configuring

### Automatic model pull

To add default models to pull on startup, you can add them to the file `./ensure-installed.txt`.
*One model per line*

Empty lines and lines beginning with `#` will be ignored.

### CUDA acceleration

To enable CUDA acceleration uncomment the `devices` sections of each service in `./docker-compose.yml`

CUDA acceleration requires that the
[NVIDIA Container Toolkit Device Interface](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/cdi-support.html)
be setup beforehand.

#### Notes

This project has been tested on Fedora 42 with `podman-compose`.
Whilst it should work with `docker compose`,
steps to ensure CUDA acceleration works properly may differ.
