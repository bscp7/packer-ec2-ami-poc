# Packer

- There are multiple ways to deply software with OS, although `Packer` is a better approach to build custom/pre-configured OS image.

---

> Ok let me try `packer` !

#### Packer features

- Its open source - matters of course :)
- HashiCorp
- MI is a pre-configured OS
- Ofcourse, it is not a configuration management tool
- Machine image can be easily created using packer. This is similar approach as https://build.opensuse.org which helps building your own distro. But packer is distro agonostic.
- Major cloud providers are supported :)

> Here, I am trying to build EC2 AMI to boot RHEL OS and contains latest updates, and pre-installed/configured Java, and Nginx. Trying to use only required fields to build simple image.

#### Install packer on Mac

```
➜ brew install packer

➜ packer --version
1.3.2
```

#### Packer inspect and validate

```
➜ packer inspect ASimpleServer.json
Variables:

  <No variables>

Builders:

  amazon-ebs

Provisioners:

  shell

➜ packer validate ASimpleServer.json
Template validated successfully.
```

#### Packer build

```
➜ packer build  ASimpleServer.json
amazon-ebs output will be in this color.

==> amazon-ebs: Prevalidating AMI Name: packer-quick-start 1541662329
    amazon-ebs: Found Image ID: ami-28e07e50
==> amazon-ebs: Using SSH Agent for existing key pair bhavesh_ec2
==> amazon-ebs: Creating temporary security group for this instance: packer_5be3e67a-9b01-1334-1cbe-eb48b61e09e8
==> amazon-ebs: Authorizing access to port 22 from 0.0.0.0/0 in the temporary security group...
==> amazon-ebs: Launching a source AWS instance...
==> amazon-ebs: Adding tags to source instance
    amazon-ebs: Adding tag: "Name": "Packer Builder"
    amazon-ebs: Instance ID: i-0ecc1e9746beb3dfd
==> amazon-ebs: Waiting for instance (i-0ecc1e9746beb3dfd) to become ready...
==> amazon-ebs: Using ssh communicator to connect: 54.185.3.7
==> amazon-ebs: Waiting for SSH to become available...
==> amazon-ebs: Connected to SSH!
==> amazon-ebs: Provisioning with shell script: bootstrap_server.sh
    amazon-ebs: Loaded plugins: amazon-id, rhui-lb, search-disabled-repos
    amazon-ebs: Resolving Dependencies
    amazon-ebs: --> Running transaction check
    amazon-ebs: ---> Package GeoIP.x86_64 0:1.5.0-11.el7 will be updated
    amazon-ebs: ---> Package GeoIP.x86_64 0:1.5.0-13.el7 will be an update
    [Lines removed for brevity]
    amazon-ebs: ---> Package libsmartcols.x86_64 0:2.23.2-59.el7 will be installed
    amazon-ebs: ---> Package linux-firmware.noarch 0:20180911-69.git85c5d90.el7 will be installed
    amazon-ebs: --> Finished Dependency Resolution
    amazon-ebs:
    amazon-ebs: Dependencies Resolved
    amazon-ebs:
    amazon-ebs: ================================================================================
    amazon-ebs:  Package         Arch   Version          Repository                        Size
    amazon-ebs: ================================================================================
    amazon-ebs: Installing:
    amazon-ebs:  kernel          x86_64 3.10.0-957.el7   rhui-REGION-rhel-server-releases  48 M
    amazon-ebs: Updating:
    amazon-ebs:  GeoIP           x86_64 1.5.0-13.el7     rhui-REGION-rhel-server-releases 1.5 M
    amazon-ebs:  NetworkManager  x86_64 1:1.12.0-7.el7_6 rhui-REGION-rhel-server-releases 1.7 M
[Lines removed for brevity]
    amazon-ebs:  zlib            x86_64 1.2.7-18.el7     rhui-REGION-rhel-server-releases  90 k
    amazon-ebs: Installing for dependencies:
    amazon-ebs:  json-c          x86_64 0.11-4.el7_0     rhui-REGION-rhel-server-releases  31 k
    amazon-ebs:  libpng          x86_64 2:1.5.13-7.el7_2 rhui-REGION-rhel-server-releases 213 k
    amazon-ebs:  libsmartcols    x86_64 2.23.2-59.el7    rhui-REGION-rhel-server-releases 140 k
    amazon-ebs:  linux-firmware  noarch 20180911-69.git85c5d90.el7
    amazon-ebs:                                          rhui-REGION-rhel-server-releases  49 M
    amazon-ebs:
    amazon-ebs: Transaction Summary
    amazon-ebs: ================================================================================
    amazon-ebs: Install    1 Package  (+4 Dependent packages)
    amazon-ebs: Upgrade  158 Packages
    amazon-ebs:
    amazon-ebs: Total download size: 235 M
    amazon-ebs: Downloading packages:
    amazon-ebs: Delta RPMs disabled because /usr/bin/applydeltarpm not installed.
    amazon-ebs: --------------------------------------------------------------------------------
    amazon-ebs: Total                                               31 MB/s | 235 MB  00:07
    amazon-ebs: Running transaction check
    amazon-ebs: Running transaction test
    amazon-ebs: Transaction test succeeded
    amazon-ebs: Running transaction
    amazon-ebs:   Updating   : libgcc-4.8.5-36.el7.x86_64                                 1/321
    amazon-ebs:   Updating   : redhat-release-server-7.6-4.el7.x86_64                     2/321
[Lines removed for brevity]
    amazon-ebs:   Cleanup    : tzdata-2018c-1.el7.noarch                                320/321
    amazon-ebs:   Cleanup    : libgcc-4.8.5-28.el7.x86_64                               321/321
    amazon-ebs:   Verifying  : python-2.7.5-76.el7.x86_64                                 1/321
    amazon-ebs:   Verifying  : 1:grub2-pc-modules-2.02-0.76.el7.noarch                    2/321
    amazon-ebs:   Verifying  : rpm-python-4.11.3-35.el7.x86_64                            3/321
[Lines removed for brevity]
    amazon-ebs:   Verifying  : 2:tar-1.26-34.el7.x86_64                                 319/321
    amazon-ebs:   Verifying  : 1:mariadb-libs-5.5.56-2.el7.x86_64                       320/321
    amazon-ebs:   Verifying  : e2fsprogs-1.42.9-11.el7.x86_64                           321/321
    amazon-ebs:
    amazon-ebs: Installed:
    amazon-ebs:   kernel.x86_64 0:3.10.0-957.el7
    amazon-ebs:
    amazon-ebs: Dependency Installed:
    amazon-ebs:   json-c.x86_64 0:0.11-4.el7_0
    amazon-ebs:   libpng.x86_64 2:1.5.13-7.el7_2
    amazon-ebs:   libsmartcols.x86_64 0:2.23.2-59.el7
    amazon-ebs:   linux-firmware.noarch 0:20180911-69.git85c5d90.el7
    amazon-ebs:
    amazon-ebs: Updated:
    amazon-ebs:   GeoIP.x86_64 0:1.5.0-13.el7
    amazon-ebs:   NetworkManager.x86_64 1:1.12.0-7.el7_6
[Lines removed for brevity]
    amazon-ebs:   yum.noarch 0:3.4.3-161.el7
    amazon-ebs:   yum-utils.noarch 0:1.1.31-50.el7
    amazon-ebs:   zlib.x86_64 0:1.2.7-18.el7
    amazon-ebs:
    amazon-ebs: Complete!
    amazon-ebs: yum update done.
    amazon-ebs: Loaded plugins: amazon-id, rhui-lb, search-disabled-repos
    amazon-ebs: No packages marked for update
    amazon-ebs: Loaded plugins: amazon-id, rhui-lb, search-disabled-repos
    amazon-ebs: Resolving Dependencies
    amazon-ebs: --> Running transaction check
    amazon-ebs: ---> Package java-1.8.0-openjdk.x86_64 1:1.8.0.191.b12-1.el7_6 will be installed
    amazon-ebs: --> Processing Dependency: java-1.8.0-openjdk-headless(x86-64) = 1:1.8.0.191.b12-1.el7_6 for package: 1:java-1.8.0-openjdk-1.8.0.191.b12-1.el7_6.x86_64
[Lines removed for brevity]
    amazon-ebs: ---> Package libXau.x86_64 0:1.0.8-2.1.el7 will be installed
    amazon-ebs: ---> Package libfontenc.x86_64 0:1.1.3-3.el7 will be installed
    amazon-ebs: ---> Package python-javapackages.noarch 0:3.4.1-11.el7 will be installed
    amazon-ebs: --> Finished Dependency Resolution
    amazon-ebs:
    amazon-ebs: Dependencies Resolved
    amazon-ebs:
    amazon-ebs: ================================================================================
    amazon-ebs:  Package             Arch   Version      Repository                        Size
    amazon-ebs: ================================================================================
    amazon-ebs: Installing:
    amazon-ebs:  java-1.8.0-openjdk  x86_64 1:1.8.0.191.b12-1.el7_6
    amazon-ebs:                                          rhui-REGION-rhel-server-releases 254 k
    amazon-ebs: Installing for dependencies:
[Lines removed for brevity]
    amazon-ebs:  tzdata-java         noarch 2018g-1.el7  rhui-REGION-rhel-server-releases 185 k
    amazon-ebs:  xorg-x11-font-utils x86_64 1:7.5-21.el7 rhui-REGION-rhel-server-releases 104 k
    amazon-ebs:  xorg-x11-fonts-Type1
    amazon-ebs:                      noarch 7.5-9.el7    rhui-REGION-rhel-server-releases 521 k
    amazon-ebs:
    amazon-ebs: Transaction Summary
    amazon-ebs: ================================================================================
    amazon-ebs: Install  1 Package (+28 Dependent packages)
    amazon-ebs:
    amazon-ebs: Total download size: 37 M
    amazon-ebs: Installed size: 118 M
    amazon-ebs: Downloading packages:
    amazon-ebs: --------------------------------------------------------------------------------
    amazon-ebs: Total                                               26 MB/s |  37 MB  00:01
    amazon-ebs: Running transaction check
    amazon-ebs: Running transaction test
    amazon-ebs: Transaction test succeeded
    amazon-ebs: Running transaction
    amazon-ebs:   Installing : libjpeg-turbo-1.2.90-6.el7.x86_64                           1/29
    amazon-ebs:   Installing : fontpackages-filesystem-1.44-8.el7.noarch                   2/29
[Lines removed for brevity]
    amazon-ebs:   Verifying  : tzdata-java-2018g-1.el7.noarch                             28/29
    amazon-ebs:   Verifying  : libfontenc-1.1.3-3.el7.x86_64                              29/29
    amazon-ebs:
    amazon-ebs: Installed:
    amazon-ebs:   java-1.8.0-openjdk.x86_64 1:1.8.0.191.b12-1.el7_6
    amazon-ebs:
    amazon-ebs: Dependency Installed:
    amazon-ebs:   alsa-lib.x86_64 0:1.1.6-2.el7
    amazon-ebs:   copy-jdk-configs.noarch 0:3.3-10.el7_5
[Lines removed for brevity]
    amazon-ebs:   xorg-x11-font-utils.x86_64 1:7.5-21.el7
    amazon-ebs:   xorg-x11-fonts-Type1.noarch 0:7.5-9.el7
    amazon-ebs:
    amazon-ebs: Complete!
    amazon-ebs: java installed
    amazon-ebs: Retrieving http://nginx.org/packages/rhel/7/noarch/RPMS/nginx-release-rhel-7-0.el7.ngx.noarch.rpm
    amazon-ebs: warning: /var/tmp/rpm-tmp.RYiFpG: Header V4 RSA/SHA1 Signature, key ID 7bd9bf62: NOKEY
    amazon-ebs: Preparing...                          ########################################
    amazon-ebs: warning: /etc/yum.repos.d/nginx.repo created as /etc/yum.repos.d/nginx.repo.rpmnew
    amazon-ebs: Updating / installing...
    amazon-ebs: nginx-release-rhel-7-0.el7.ngx        ########################################
    amazon-ebs: Loaded plugins: amazon-id, rhui-lb, search-disabled-repos
    amazon-ebs: Resolving Dependencies
    amazon-ebs: --> Running transaction check
    amazon-ebs: ---> Package nginx.x86_64 1:1.14.1-1.el7_4.ngx will be installed
    amazon-ebs: --> Finished Dependency Resolution
    amazon-ebs:
    amazon-ebs: Dependencies Resolved
    amazon-ebs:
    amazon-ebs: ================================================================================
    amazon-ebs:  Package       Arch           Version                       Repository     Size
    amazon-ebs: ================================================================================
    amazon-ebs: Installing:
    amazon-ebs:  nginx         x86_64         1:1.14.1-1.el7_4.ngx          nginx         753 k
    amazon-ebs:
    amazon-ebs: Transaction Summary
    amazon-ebs: ================================================================================
    amazon-ebs: Install  1 Package
    amazon-ebs:
    amazon-ebs: Total download size: 753 k
    amazon-ebs: Installed size: 2.6 M
    amazon-ebs: Downloading packages:
    amazon-ebs: Warning: RPMDB altered outside of yum.
    amazon-ebs: Running transaction check
    amazon-ebs: Running transaction test
    amazon-ebs: Transaction test succeeded
    amazon-ebs: Running transaction
    amazon-ebs:   Installing : 1:nginx-1.14.1-1.el7_4.ngx.x86_64                            1/1
    amazon-ebs: ----------------------------------------------------------------------
    amazon-ebs:
    amazon-ebs: Thanks for using nginx!
    amazon-ebs:
    amazon-ebs: Please find the official documentation for nginx here:
    amazon-ebs: * http://nginx.org/en/docs/
    amazon-ebs:
    amazon-ebs: Please subscribe to nginx-announce mailing list to get
    amazon-ebs: the most important news about nginx:
    amazon-ebs: * http://nginx.org/en/support.html
    amazon-ebs:
    amazon-ebs: Commercial subscriptions for nginx are available on:
    amazon-ebs: * http://nginx.com/products/
    amazon-ebs:
    amazon-ebs: ----------------------------------------------------------------------
    amazon-ebs:   Verifying  : 1:nginx-1.14.1-1.el7_4.ngx.x86_64                            1/1
    amazon-ebs:
    amazon-ebs: Installed:
    amazon-ebs:   nginx.x86_64 1:1.14.1-1.el7_4.ngx
    amazon-ebs:
    amazon-ebs: Complete!
    amazon-ebs: nginx installed
    amazon-ebs: nginx static webpage added
    amazon-ebs: Redirecting to /bin/systemctl start nginx.service
    amazon-ebs: Created symlink from /etc/systemd/system/multi-user.target.wants/nginx.service to /usr/lib/systemd/system/nginx.service.
    amazon-ebs: nginx started
    amazon-ebs:   % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
    amazon-ebs:                                  Dload  Upload   Total   Spent    Left  Speed
    amazon-ebs: <!DOCTYPE html>
    amazon-ebs: 100   103  100   103    0     0  15655      0 --:--:-- --:--:-- --:--:-- 17166
    amazon-ebs: <html>
    amazon-ebs: <head><title>Hey nginx!</title></head>
    amazon-ebs: <body>
    amazon-ebs: <h1>Success!</h1>
    amazon-ebs: </body>
    amazon-ebs: </html>
==> amazon-ebs: Stopping the source instance...
    amazon-ebs: Stopping instance, attempt 1
==> amazon-ebs: Waiting for the instance to stop...
==> amazon-ebs: Creating unencrypted AMI packer-quick-start 1541662329 from instance i-0ecc1e9746beb3dfd
    amazon-ebs: AMI: ami-0b6aee1606d914ef5
==> amazon-ebs: Waiting for AMI to become ready...
==> amazon-ebs: Terminating the source AWS instance...
==> amazon-ebs: Cleaning up any extra volumes...
==> amazon-ebs: No volumes to clean up, skipping
==> amazon-ebs: Deleting temporary security group...
Build 'amazon-ebs' finished.

==> Builds finished. The artifacts of successful builds are:
--> amazon-ebs: AMIs were created:
us-west-2: ami-0b6aee1606d914ef5
```

#### Launch instance using the newly generated image

#### Test

#### Login to the instance and check logs

```
[ec2-user@ip-10-0-0-83 ~]$ sudo tail -f /var/log/nginx/access.log
X.X.X.X - - [08/Nov/2018:07:50:16 +0000] "GET / HTTP/1.1" 200 103 "-" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.0.1 Safari/605.1.15" "-"
^C
```

## References

- amazon-ebs: https://www.packer.io/docs/builders/amazon-ebs.html