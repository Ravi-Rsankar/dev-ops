## Swarm Concepts and Commands

### Quick Overview

To use docker in swarm mode, install docker.

A cluster of docker engines are called *swarm*.

A **swarm** consists of multiple Docker hosts which run in **swarm mode** and act as managers (to manage membership and delegation) and workers (which run [swarm services](https://docs.docker.com/engine/swarm/key-concepts/#services-and-tasks)). A given Docker host can be a manager, a worker, or perform both roles. 

A **node** is an instance of the Docker engine  participating in the swarm. You can also think of this as a Docker node. You can run one or more nodes on a single physical computer or cloud  server, but production swarm deployments typically include Docker nodes  distributed across multiple physical and cloud machines.

To deploy your application to a swarm, you submit a service definition to a **manager node**. The manager node dispatches units of work called [tasks](https://docs.docker.com/engine/swarm/key-concepts/#services-and-tasks) to worker nodes.

A **service** is the definition of the tasks to execute on the manager or worker nodes. It is the central structure of the swarm system and the primary root of user interaction with the swarm.

When you create a service, you specify which container image to use and which commands to execute inside running containers.

A **task** carries a Docker container and the commands to run inside the container. It is the atomic scheduling unit of swarm. Manager nodes assign tasks to worker nodes according to the number of replicas set in the service scale. Once a task is assigned to a node, it cannot move to another node. It can only run on the assigned node or fail.



#### Initialize a swarm 

```
docker swarm init --advertise-addr <ip of the manager node>
```

The docker engine targeted by this command becomes a manager in the newly created single-node swarm.

`docker swarm init` generates two random tokens, a worker token and a manager token. When you join a new node to the swarm, the node joins as a worker or manager node based upon the token you pass to [swarm join](https://docs.docker.com/engine/reference/commandline/swarm_join/).

After you create the swarm, you can display or rotate the token using [swarm join-token](https://docs.docker.com/engine/reference/commandline/swarm_join-token/).

#### Manage join tokens

Join tokens displays the token

```
docker swarm join-token worker
```

This displays the token to join the manager node. Use the join worker command and pass this token to join a node as a worker to the manager node.

#### Join worker node to the swarm

```
docker swarm join \
    --token SWMTKN-1-49nj1cmql0jkz5s954yi3oex3nedyz0fb0xx14ie39trti4wxv-8vxv8rssmk743ojnwacrr2e7c \
    192.168.99.100:2377
```

When joining a worker to a manager check if all the docker ports are opened. Also allow them through the firewall if necessary

#### List the docker nodes in swarm

```
docker node ls
```

#### Leave a swarm

```
docker swarm leave [OPTIONS]
OPTION: --force
```

If the node is a manager then force leave

#### Swarm status

```
docker info
```

