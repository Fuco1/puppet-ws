# puppet-ws

Puppet to set up my personal workstations.

# Install

Right now some of the steps depend on my [dotfiles](https://github.com/Fuco1/dotfiles) being present so you might get errors if you run it in a virtual or somewhere testing.  I will try to set up Hiera properly to take care of configurable arguments.

``` shell
apt-get update && apt-get install -y curl && curl -fsSL https://raw.githubusercontent.com/Fuco1/puppet-ws/master/bootstrap | bash
```

# Building from sources

The majority of applications is pulled in as packages but for some I prefer building from sources.  To build applications reliably I use [docker](https://www.docker.com/) to isolate the build dependencies from the environment.  I have "invented" a [simple standard](https://github.com/Fuco1/build-base) way to set up these build projects and a corresponding [puppet module](https://github.com/Fuco1/puppet-ws/tree/master/local-modules/build/manifests) to pull, build & install.

# Inspiration

This setup was mostly inspired by https://github.com/EtiennePerot/pupfiles and https://github.com/vincentbernat/puppet-workstation; go and check it out!
