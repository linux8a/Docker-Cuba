## Ambiente Docker usando vagrant

Aporte de Argenis Ochoa Gonzalez (@linux8a)

Vagrant permite a los usuarios crear y configurar entornos de desarrollo ligeros, reproducibles y portátiles. Vagrant puede trabajar con diferentes proveedores. Por defecto usa virtualbox, pero puedes usar libvirt, VMware, Hyper-V etc.

## Ambiente reproducible

* [Vagrant usando source uclv](https://github.com/linux8a/Docker-Cuba/tree/master/Vagrant%20Ambiente%20Lab%20Docker/Vagrant%20source%20Universidad%20de%20uclv%20Cuba/Ubuntu)

    * Ubuntu 20.04

        <details>
        <summary>Vagranfile</summary>

        ```
        # -*- mode: ruby -*-
        # vi: set ft=ruby :
        ### Customize

        CPU = "1"
        RAM = "1024"
        INTERFACE_BRIDGE = "wlan0"

        Vagrant.configure("2") do |config|

        config.vm.box = "bento/ubuntu-20.04"
        end

        # Port forwarding
        Vagrant.configure("2") do |config|

        config.vm.provision "shell", inline: <<-SHELL

            sed -i 's/#PermitRootLogin\ prohibit-password/PermitRootLogin\ prohibit-password/' /etc/ssh/sshd_config
            sed -i 's/#PasswordAuthentication\ no/PasswordAuthentication\ no/' /etc/ssh/sshd_config
            service ssh restart

            # Add authorized_keys. Escriba su llave y descomente la linea para qe se cargue
            echo "ssh-rsa AAAAB3NzaC1yc2EAAAADA" >> /home/vagrant/.ssh/authorized_keys
        
        ### Set repo Universidad uclv
        sed -i 's/archive.ubuntu.com/repos.uclv.edu.cu/' /etc/apt/sources.list
        sed -i 's/security.ubuntu.com/repos.uclv.edu.cu/' /etc/apt/sources.list
        ## Install docker docker-compose from repo
            apt update && apt upgrade -y && apt install docker.io docker-compose -y
        SHELL

        config.vm.network  "public_network", bridge: INTERFACE_BRIDGE  
        #config.vm.network "forwarded_port", guest: 80, host: 8080
        config.vm.provider :virtualbox do |vb|
            vb.customize ["modifyvm", :id, "--cpus", CPU]
            vb.customize ["modifyvm", :id, "--memory", RAM]
        end

        end
        ```

        </details>

* [Vagrant usando source oficial](https://github.com/linux8a/Docker-Cuba/tree/master/Vagrant%20Ambiente%20Lab%20Docker/Vagrant%20source%20oficial/Ubuntu)
    
    * Ubuntu 20.04

        <details>
        <summary>Vagranfile</summary>

        ```
        # -*- mode: ruby -*-
        # vi: set ft=ruby :
        ### Customize

        CPU = "2"
        RAM = "2048"
        INTERFACE_BRIDGE = "wlan0"

        Vagrant.configure("2") do |config|

        config.vm.box = "bento/ubuntu-20.04"
        end

        # Port forwarding
        Vagrant.configure("2") do |config|

        config.vm.provision "shell", inline: <<-SHELL

            sed -i 's/#PermitRootLogin\ prohibit-password/PermitRootLogin\ prohibit-password/' /etc/ssh/sshd_config
            sed -i 's/#PasswordAuthentication\ no/PasswordAuthentication\ no/' /etc/ssh/sshd_config
            service ssh restart

            # Add authorized_keys. Escriba su llave y descomente la linea para qe se cargue
        # echo "ssh-rsa AAAAB3NzaC1yc2" >> /home/vagrant/.ssh/authorized_keys
            
        ## Install docker docker-compose from repo
            apt update && apt upgrade -y && apt install docker.io docker-compose -y
        SHELL

        config.vm.network  "public_network", bridge: INTERFACE_BRIDGE  
        #config.vm.network "forwarded_port", guest: 80, host: 8080
        config.vm.provider :virtualbox do |vb|
            vb.customize ["modifyvm", :id, "--cpus", CPU]
            vb.customize ["modifyvm", :id, "--memory", RAM]
        end

        end
        ```

        </details>


## Configuraciones optimizacones

Puede ajustar los recursos que deseara asignar ajustando estas variables del fichero vagrantfile

```
CPU = "2"
RAM = "2048"
INTERFACE_BRIDGE = "wlan0"
```

*Nota:* _Si desea cambiar el proveedor a usar. Debe modificar esta linea `  config.vm.provider :virtualbox do |vb|` Escriba el nuevo proveedor que usara_ 

## Uso :-)

Levantamos el entorno y accedemos a el.

```
vagrant up
vagrant ssh
```

### Referencia

https://developer.hashicorp.com/vagrant/tutorials/getting-started/getting-started-index


* Donacion:

![Donacion](../.donacion_enzona.png)

o un usd en bitcoin

![Donacion](../.donacion_bitcoin.png)
