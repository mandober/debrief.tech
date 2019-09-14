# Windows Containers


Virtualization
[https://docs.microsoft.com/en-us/virtualization/]

About Windows Containers
[https://docs.microsoft.com/en-us/virtualization/windowscontainers/about/]

Windows-based containers: modern app development
[https://www.youtube.com/watch?time_continue=25&v=Ryx3o0rD5lY]

Windows 10 Hyper-V System Requirements
[https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/reference/hyper-v-requirements]

Supported Ubuntu virtual machines on Hyper-V
[https://docs.microsoft.com/en-us/windows-server/virtualization/hyper-v/Supported-Ubuntu-virtual-machines-on-Hyper-V]


https://docs.docker.com/engine/reference/commandline/dockerd/#/windows-configuration-file

https://docs.microsoft.com/en-us/azure/service-fabric/service-fabric-tutorial-create-container-images

https://docs.microsoft.com/en-us/azure/service-fabric/service-fabric-get-started-vs-code

A container puts an app and everything that app needs to run into its own isolated box. As a result, the isolated app has no knowledge of any other apps or processes that exist outside its container. Because the container has everything the app needs to run, the container can be moved anywhere, using only the resources its host provisions without touching any resources provisioned for other containers.

## Container fundamentals

* *Container host*: 
  A physical (or even another virtual) computer system configured with the `Windows container` feature. The container host runs Windows containers.
* *Sandbox*: 
  The layer that captures all changes you make to the container while it's running (changes in FS, registry, app installs, etc).
* *Base image*: 
  The first layer in the image layers of a container that provides the container's OS env. A base image can't be modified.
* *Container image*: 
  A read-only template of instructions for creating a container. Images can be based on a basic, unaltered OS env, but can also be created from the sandbox of a modified container. These modified images layer their changes on top of the base image layer, and these layers can be copied and reapplied to other base images to create a new image with those same changes.
* *Container repository*: 
  The local repository that stores your container image and its dependencies each time you create a new image. You can reuse stored images as many times as you want on the container host. You can also store the container images in a public or private registry, such as Docker Hub, so they can be used across many different container hosts.
* *Container orchestrator*: 
  a process that automates and manages a large number of containers and how they interact with each other. 
* *Docker*: 
  an automated process that packages and delivers container images.
  * [Docker overview](https://docs.microsoft.com/en-us/virtualization/windowscontainers/about/docker-overview)
  * [Docker Engine on Windows](https://docs.microsoft.com/en-us/virtualization/windowscontainers/manage-docker/configure-docker-daemon)
  * [Docker website](https://www.docker.com/)


Windows Container orchestrator
[https://docs.microsoft.com/en-us/virtualization/windowscontainers/about/overview-container-orchestrators]


## Containers vs Virtual Machines

The technology and concepts behind containers are vastly different from virtual machines (VM). To learn more about these concepts, read Mark Russinovich's blog post that explains the differences in more detail:
[https://azure.microsoft.com/en-us/blog/containers-docker-windows-and-trends/]


## Windows container types

There are two different container types, also known as runtimes.

**Windows Server containers** provide application isolation through process and namespace isolation technology, which is why these containers are also referred to as *process-isolated containers*. A Windows Server container shares a kernel with the container host and all containers running on the host. These process-isolated containers don't provide a hostile security boundary and shouldn't be used to isolate untrusted code. `Because of the shared kernel space, these containers require the same kernel version and configuration`.

**Hyper-V isolation** expands on the isolation provided by Windows Server containers by `running each container in a highly optimized virtual machine`. In this configuration, the container host doesn't share its kernel with other containers on the same host. These containers are designed for hostile multitenant hosting with the same security assurances of a virtual machine. Since these containers don't share the kernel with the host or other containers on the host, they can run kernels with different versions and configurations (within supported versions). For example, all Windows containers on Windows 10 use Hyper-V isolation to utilize the Windows Server kernel version and configuration.

Running a container on Windows with or without Hyper-V isolation is a runtime decision. You can initially create the container with Hyper-V isolation, and then later at runtime choose to run it as a Windows Server container instead.


## Windows Containers on Windows 10

[https://docs.microsoft.com/en-us/virtualization/windowscontainers/quick-start/quick-start-windows-10]

https://docs.microsoft.com/en-us/virtualization/windowscontainers/manage-docker/configure-docker-daemon

https://www.docker.com/

https://docs.microsoft.com/en-us/virtualization/windowscontainers/kubernetes/getting-started-kubernetes-windows
