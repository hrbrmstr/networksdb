
[![Project Status: Active – The project has reached a stable, usable
state and is being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![Signed
by](https://img.shields.io/badge/Keybase-Verified-brightgreen.svg)](https://keybase.io/hrbrmstr)
![Signed commit
%](https://img.shields.io/badge/Signed_Commits-100%25-lightgrey.svg)
[![Linux build
Status](https://travis-ci.org/hrbrmstr/networksdb.svg?branch=master)](https://travis-ci.org/hrbrmstr/networksdb)  
![Minimal R
Version](https://img.shields.io/badge/R%3E%3D-3.2.0-blue.svg)
![License](https://img.shields.io/badge/License-MIT-blue.svg)

# networksdb

Query Organization, IP, DNS, and Network Info From NetworksDB

## Description

NetworksDB <https://networksdb.io> contains information about the public
IPv4 and IPv6 addresses, networks and domains owned by companies and
organisations across the world along with city-level IP geolocation data
and autonomous system information. Tools are provided to query the
NetworksDB API.

## What’s Inside The Tin

The following functions are implemented:

  - `networksdb_api_key`: Get or set NetworksDB Personal Access Token
  - `org_info`: Retreive information about an organisation.
  - `org_networks`: Search for the public networks owned by an
    organisation.
  - `org_search`: Search for organisations matching a search term.

## Installation

``` r
remotes::install_git("https://git.rud.is/hrbrmstr/networksdb.git")
# or
remotes::install_git("https://git.sr.ht/~hrbrmstr/networksdb")
# or
remotes::install_gitlab("hrbrmstr/networksdb")
# or
remotes::install_github("hrbrmstr/networksdb")
```

NOTE: To use the ‘remotes’ install options you will need to have the
[{remotes} package](https://github.com/r-lib/remotes) installed.

## Usage

``` r
library(networksdb)

# current version
packageVersion("networksdb")
## [1] '0.1.0'
```

## networksdb Metrics

| Lang | \# Files |  (%) | LoC | (%) | Blank lines |  (%) | \# Lines |  (%) |
| :--- | -------: | ---: | --: | --: | ----------: | ---: | -------: | ---: |
| R    |        7 | 0.88 |  72 | 0.9 |          27 | 0.64 |       41 | 0.59 |
| Rmd  |        1 | 0.12 |   8 | 0.1 |          15 | 0.36 |       28 | 0.41 |

## Code of Conduct

Please note that this project is released with a Contributor Code of
Conduct. By participating in this project you agree to abide by its
terms.
