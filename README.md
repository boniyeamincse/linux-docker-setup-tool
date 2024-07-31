### `README.md`

```markdown
# Linux Docker Setup Script

This repository contains a Bash script for setting up a Linux system by updating the OS, installing Docker, and installing common utilities. The script provides an interactive menu to guide the user through these tasks.

## Repository Structure

```
linux-docker-setup/
│
├── scripts/
│   ├── setup_script.sh        # The main Bash script
│   └── README.md              # User guide for the script
│
└── README.md                  # Main repository README
```

## Usage Guide

### Cloning the Repository

First, clone the repository to your local machine:

```sh
git clone https://github.com/your-username/linux-docker-setup.git
```

Navigate to the `scripts` directory:

```sh
cd linux-docker-setup/scripts
```

### Running the Setup Script

Make the script executable:

```sh
chmod +x setup_script.sh
```

Run the script:

```sh
./setup_script.sh
```

### Menu Options

The script presents a menu with the following options:

1. **Update OS**
2. **Install Docker**
3. **Install Common Utilities**
4. **Exit**

#### 1. Update OS

This option updates the OS packages to the latest versions. To update the OS, select option `1` and press Enter.

```sh
Enter your choice [1-4]: 1
```

#### 2. Install Docker

This option installs Docker and adds your user to the Docker group. To install Docker, select option `2` and press Enter.

```sh
Enter your choice [1-4]: 2
```

You may need to log out and log back in for the changes to take effect.

#### 3. Install Common Utilities

This option installs common utilities such as `vim`, `git`, `curl`, `wget`, and `htop`. To install these utilities, select option `3` and press Enter.

```sh
Enter your choice [1-4]: 3
```

#### 4. Exit

This option exits the script. To exit, select option `4` and press Enter.

```sh
Enter your choice [1-4]: 4
```

### Functions Overview

- **update_os()**: Updates the OS packages using `apt`.
- **install_docker()**: Installs Docker and adds the user to the Docker group.
- **install_common_utilities()**: Installs common utilities such as `vim`, `git`, `curl`, `wget`, and `htop`.

### Notes

- Ensure you have the necessary permissions to run the script and install packages.
- For Docker installation, logging out and logging back in may be required for the changes to take effect.

### Contact

For any issues or questions, please contact [Boni Yeamin](mailto:boniyeamin.cse@gmail.com).
```

This `README.md` file provides a comprehensive user guide for the repository, including instructions for cloning the repository, running the script, and using the various options available in the script's menu.
