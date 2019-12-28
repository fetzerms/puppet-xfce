# xfce

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with xfce](#setup)
    * [What xfce affects](#what-xfce-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with xfce](#beginning-with-xfce)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Limitations - OS compatibility, etc.](#limitations)
5. [Development - Guide for contributing to the module](#development)

## Description

This module provides a simple setup of XFCE. At the moment, it only installs the basic XFCE4 package.

## Setup

### What xfce affects

The following packages will be installed:
* `xfce4`

The default font of XFCE will be reset to `Cantarell 10`.

### Beginning with xfce

This will install XFCE and set the default font to `Cantarell 10`:

```puppet
include xfce
```

## Usage

Part of installing this package is setting the default font in XFCE. Setting this default font may require the Display Manager service to be 
restarted before first use. To avoid having to do this restart, you can set a parameter with the name of the Display Manager service - if 
that exists in the catalog, then XFCE will be installed _before_ that service. For example, if you are already installing `lightdm` (maybe 
with the [`paulwalkeruk/lightdm`](https://forge.puppet.com/paulwalkeruk/lightdm) package), then you could specify it like this (note: 
setting this parameter doesn't install the display manager, you have to do that separately, this parameter simply ensures XFCE is installed 
first to avoid having to do a restart):

```puppet
  class { 'xfce ': 
    display_manager => 'lightdm',
  }
```

## Limitations

This has beed designed for and tested on Arch Linux.

## Development

Pull requests are welcome.