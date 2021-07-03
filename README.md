# autostart
The Simplest way to make your application as servce by addapting ``versatile systemctl unit file`` and providing ``useful command`` for system starting/stoping/status-checking.

## For what application?
This is for application:

- just call single command file
- The name of the folder that contains the command is the same as the command file name

For example:

```
--usefullcommand  (folder name)
    |
    -- usefullcommand (executable file)
    |
```

## install
Install this as ``submodule`` into your project as follow:

```
cd your-project-dir
git submodule add git@github.com:UedaTakeyuki/autostart.git
```

## setup
Call ``setup.sh`` to make symbolic links to your project as follow:

```
cd autostart
./setup.sh
```

The following links must be created on your project

- autostart.service
- autostart.sh
