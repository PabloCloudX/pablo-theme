# Pterodactyl Auto Installer

This repository provides an all-in-one auto installer for setting up the Pterodactyl panel, applying custom themes, and configuring Wings/Node. The installer simplifies the setup process, making it easier and quicker to get your game server management platform up and running.

## Features

- **Pterodactyl Panel Installation**: Automatically installs the latest version of the Pterodactyl panel, including all necessary dependencies.
- **Custom Theme Integration**: Applies a custom theme to the Pterodactyl panel during installation, giving it a fresh and modern look.
- **Wings/Node Setup**: Configures and sets up Pterodactyl Wings, enabling you to add and manage nodes with ease.
- **Fully Automated**: The entire process is automated, from downloading dependencies to configuring the panel, theme, and nodes.

## Prerequisites

Before running the installer, ensure your server meets the following requirements:

- A clean installation of a supported Linux distribution (Ubuntu 20.04-22.04 or CentOS 8 recommended)
- Root or sudo access to the server
- Internet connection for downloading necessary files

## Installation

To start the installation process, run the following command in your terminal:

```bash
bash <(curl -s https://raw.githubusercontent.com/PabloTzy/pablo-theme/main/install.sh)
```

This command will download and execute the installation script, guiding you through the setup process.

## Customization

After installation, you can further customize the Pterodactyl panel by adjusting configuration files or applying additional themes and plugins. Detailed instructions for customization can be found in the [Pterodactyl Documentation](https://pterodactyl.io/).

## Support

If you encounter any issues during installation or setup, please open an issue on the [GitHub repository](https://github.com/PabloTzy/pablo-theme/issues) or refer to the [Pterodactyl Community](https://discord.gg/pterodactyl).

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
