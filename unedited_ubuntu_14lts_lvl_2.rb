control "xccdf_org.cisecurity.benchmarks_rule_1.1_Install_Updates_Patches_and_Additional_Security_Software" do
  title "Install Updates, Patches and Additional Security Software"
  desc  "Periodically patches are released for included software either due to security flaws or to include additional functionality."
  impact 0.0
end

control "xccdf_org.cisecurity.benchmarks_rule_2.1_Create_Separate_Partition_for_tmp" do
  title "Create Separate Partition for /tmp"
  desc  "The /tmp directory is a world-writable directory used for temporary storage by all users and some applications."
  impact 1.0
  describe bash("egrep \"^[^#]\" /etc/fstab | awk '{print $2}'") do
    its("stdout") { should match /^\/tmp$/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_2.2_Set_nodev_option_for_tmp_Partition" do
  title "Set nodev option for /tmp Partition"
  desc  "The nodev mount option specifies that the filesystem cannot contain special devices."
  impact 1.0
  describe bash("egrep \"^[^#]\" /etc/fstab | awk '($2 == \"/tmp\") { print $4 }'") do
    its("stdout") { should match /nodev/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_2.3_Set_nosuid_option_for_tmp_Partition" do
  title "Set nosuid option for /tmp Partition"
  desc  "The nosuid mount option specifies that the filesystem cannot contain set userid files."
  impact 1.0
  describe bash("egrep \"^[^#]\" /etc/fstab | awk '($2 == \"/tmp\") { print $4 }'") do
    its("stdout") { should match /nosuid/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_2.4_Set_noexec_option_for_tmp_Partition" do
  title "Set noexec option for /tmp Partition"
  desc  "The noexec mount option specifies that the filesystem cannot contain executable binaries."
  impact 1.0
  describe bash("egrep \"^[^#]\" /etc/fstab | awk '($2 == \"/tmp\") { print $4 }'") do
    its("stdout") { should match /noexec/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_2.5_Create_Separate_Partition_for_var" do
  title "Create Separate Partition for /var"
  desc  "The /var directory is used by daemons and other system services to temporarily store dynamic data. Some directories created by these processes may be world-writable."
  impact 1.0
  describe bash("egrep \"^[^#]\" /etc/fstab | awk '{print $2}'") do
    its("stdout") { should match /^\/var$/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_2.6_Bind_Mount_the_vartmp_directory_to_tmp" do
  title "Bind Mount the /var/tmp directory to /tmp"
  desc  "The /var/tmp directory is normally a standalone directory in the /var file system. Binding /var/tmp to /tmp establishes an unbreakable link to /tmp that cannot be removed (even by the root user). It also allows /var/tmp to inherit the same mount options that /tmp owns, allowing /var/tmp to be protected in the same manner /tmp is protected. It will also prevent /var from filling up with temporary files as the contents of /var/tmp will actually reside in the file system containing /tmp."
  impact 1.0
  describe bash("egrep \"^[^#]\" /etc/fstab | awk '($2 == \"/var/tmp\") { print $4 }'") do
    its("stdout") { should match /bind/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_2.7_Create_Separate_Partition_for_varlog" do
  title "Create Separate Partition for /var/log"
  desc  "The /var/log directory is used by system services to store log data ."
  impact 1.0
  describe bash("egrep \"^[^#]\" /etc/fstab | awk '{print $2}'") do
    its("stdout") { should match /^\/var\/log$/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_2.8_Create_Separate_Partition_for_varlogaudit" do
  title "Create Separate Partition for /var/log/audit"
  desc  "The auditing daemon, auditd, stores log data in the /var/log/audit directory."
  impact 1.0
  describe bash("egrep \"^[^#]\" /etc/fstab | awk '{print $2}'") do
    its("stdout") { should match /^\/var\/log\/audit$/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_2.9_Create_Separate_Partition_for_home" do
  title "Create Separate Partition for /home"
  desc  "The /home directory is used to support disk storage needs of local users."
  impact 1.0
  describe bash("egrep \"^[^#]\" /etc/fstab | awk '{print $2}'") do
    its("stdout") { should match /^\/home$/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_2.10_Add_nodev_Option_to_home" do
  title "Add nodev Option to /home"
  desc  "When set on a file system, this option prevents character and block special devices from being defined, or if they exist, from being used as character and block special devices."
  impact 1.0
  describe bash("egrep \"^[^#]\" /etc/fstab | awk '($2 == \"/home\") { print $4 }'") do
    its("stdout") { should match /nodev/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_2.11_Add_nodev_Option_to_Removable_Media_Partitions" do
  title "Add nodev Option to Removable Media Partitions"
  desc  "Set nodev on removable media to prevent character and block special devices that are present on the removable media from being treated as device files."
  impact 0.0
end

control "xccdf_org.cisecurity.benchmarks_rule_2.12_Add_noexec_Option_to_Removable_Media_Partitions" do
  title "Add noexec Option to Removable Media Partitions"
  desc  "Set noexec on removable media to prevent programs from executing from the removable media."
  impact 0.0
end

control "xccdf_org.cisecurity.benchmarks_rule_2.13_Add_nosuid_Option_to_Removable_Media_Partitions" do
  title "Add nosuid Option to Removable Media Partitions"
  desc  "Set nosuid on removable media to prevent setuid and setgid executable files that are on that media from being executed as setuid and setgid."
  impact 0.0
end

control "xccdf_org.cisecurity.benchmarks_rule_2.14_Add_nodev_Option_to_runshm_Partition" do
  title "Add nodev Option to /run/shm Partition"
  desc  "The nodev mount option specifies that the /run/shm (temporary filesystem stored in memory) cannot contain block or character special devices."
  impact 1.0
  describe bash("egrep \"^[^#]\" /etc/fstab | awk '($2 == \"/run/shm\") { print $4 }'") do
    its("stdout") { should match /nodev/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_2.15_Add_nosuid_Option_to_runshm_Partition" do
  title "Add nosuid Option to /run/shm Partition"
  desc  "The nosuid mount option specifies that the /run/shm (temporary filesystem stored in memory) will not execute setuid and setgid on executable programs as such, but rather execute them with the uid and gid of the user executing the program."
  impact 1.0
  describe bash("egrep \"^[^#]\" /etc/fstab | awk '($2 == \"/run/shm\") { print $4 }'") do
    its("stdout") { should match /nosuid/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_2.16_Add_noexec_Option_to_runshm_Partition" do
  title "Add noexec Option to /run/shm Partition"
  desc  "Set noexec on the shared memory partition to prevent programs from executing from there."
  impact 1.0
  describe bash("egrep \"^[^#]\" /etc/fstab | awk '($2 == \"/run/shm\") { print $4 }'") do
    its("stdout") { should match /noexec/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_2.17_Set_Sticky_Bit_on_All_World-Writable_Directories" do
  title "Set Sticky Bit on All World-Writable Directories"
  desc  "Setting the sticky bit on world writable directories prevents users from deleting or renaming files in that directory that are not owned by them."
  impact 1.0
  describe bash("df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -type d \\( -perm -0002 -a ! -perm -1000 \\) 2>/dev/null") do
    its("stdout") { should_not match /.+/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_2.18_Disable_Mounting_of_cramfs_Filesystems" do
  title "Disable Mounting of cramfs Filesystems"
  desc  "The cramfs filesystem type is a compressed read-only Linux filesystem embedded in small footprint systems. A cramfs image can be used without having to first decompress the image."
  impact 0.0
  describe bash("modprobe -n -v cramfs") do
    its("stdout") { should match /^install \/bin\/true/ }
  end
  describe bash("lsmod | egrep \"^cramfs\\s\"") do
    its("exit_status") { should_not eq 0 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_2.19_Disable_Mounting_of_freevxfs_Filesystems" do
  title "Disable Mounting of freevxfs Filesystems"
  desc  "The freevxfs filesystem type is a free version of the Veritas type filesystem. This is the primary filesystem type for HP-UX operating systems."
  impact 0.0
  describe bash("modprobe -n -v freevxfs") do
    its("stdout") { should match /^install \/bin\/true/ }
  end
  describe bash("lsmod | egrep \"^freevxfs\\s\"") do
    its("exit_status") { should_not eq 0 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_2.20_Disable_Mounting_of_jffs2_Filesystems" do
  title "Disable Mounting of jffs2 Filesystems"
  desc  "The jffs2 (journaling flash filesystem 2) filesystem type is a log-structured filesystem used in flash memory devices."
  impact 0.0
  describe bash("modprobe -n -v jffs2") do
    its("stdout") { should match /^install \/bin\/true/ }
  end
  describe bash("lsmod | egrep \"^jffs2\\s\"") do
    its("exit_status") { should_not eq 0 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_2.21_Disable_Mounting_of_hfs_Filesystems" do
  title "Disable Mounting of hfs Filesystems"
  desc  "The hfs filesystem type is a hierarchical filesystem that allows you to mount Mac OS filesystems."
  impact 0.0
  describe bash("modprobe -n -v hfs") do
    its("stdout") { should match /^install \/bin\/true/ }
  end
  describe bash("lsmod | egrep \"^hfs\\s\"") do
    its("exit_status") { should_not eq 0 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_2.22_Disable_Mounting_of_hfsplus_Filesystems" do
  title "Disable Mounting of hfsplus Filesystems"
  desc  "The hfsplus filesystem type is a hierarchical filesystem designed to replace hfs that allows you to mount Mac OS filesystems."
  impact 0.0
  describe bash("modprobe -n -v hfsplus") do
    its("stdout") { should match /^install \/bin\/true/ }
  end
  describe bash("lsmod | egrep \"^hfsplus\\s\"") do
    its("exit_status") { should_not eq 0 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_2.23_Disable_Mounting_of_squashfs_Filesystems" do
  title "Disable Mounting of squashfs Filesystems"
  desc  "The squashfs filesystem type is a compressed read-only Linux filesystem embedded in small footprint systems (similar to cramfs). A squashfs image can be used without having to first decompress the image."
  impact 0.0
  describe bash("modprobe -n -v squashfs") do
    its("stdout") { should match /^install \/bin\/true/ }
  end
  describe bash("lsmod | egrep \"^squashfs\\s\"") do
    its("exit_status") { should_not eq 0 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_2.24_Disable_Mounting_of_udf_Filesystems" do
  title "Disable Mounting of udf Filesystems"
  desc  "The udf filesystem type is the universal disk format used to implement ISO/IEC 13346 and ECMA-167 specifications. This is an open vendor filesystem type for data storage on a broad range of media. This filesystem type is necessary to support writing DVDs and newer optical disc formats."
  impact 0.0
  describe bash("modprobe -n -v udf") do
    its("stdout") { should match /^install \/bin\/true/ }
  end
  describe bash("lsmod | egrep \"^udf\\s\"") do
    its("exit_status") { should_not eq 0 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_2.25_Disable_Automounting" do
  title "Disable Automounting"
  desc  "autofs allows automatic mounting of devices, typically including CD/DVDs and USB drives."
  impact 1.0
  describe bash("initctl show-config autofs | egrep \"^\\s*start\"") do
    its("exit_status") { should_not eq 0 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_3.1_Set_UserGroup_Owner_on_bootloader_config" do
  title "Set User/Group Owner on bootloader config"
  desc  "Set the owner and group of your boot loaders config file to the root user. These instructions default to GRUB stored at /boot/grub/grub.cfg."
  impact 1.0
  describe bash("stat -c \"%u %g\" /boot/grub/grub.cfg") do
    its("stdout") { should match /0 0/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_3.2_Set_Permissions_on_bootloader_config" do
  title "Set Permissions on bootloader config"
  desc  "Set permission on the your boot loaders config file to read and write for root only."
  impact 1.0
  describe bash("ui=($(echo 0077 -n | fold -w1));sys=($(stat -L --format=\"%a\" /boot/grub/grub.cfg | awk '{printf \"%04d\\n\", $0;}' | fold -w1));for (( i=0; i<4; i++ )); do echo -n $(( ${ui[$i]} & ${sys[$i]})); done;").stdout.to_s.[](/^(\d+)$/, 1) do
    it { should eq "0000" }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_3.3_Set_Boot_Loader_Password" do
  title "Set Boot Loader Password"
  desc  "Setting the boot loader password will require that anyone rebooting the system must enter a password before being able to set command line boot parameters"
  impact 1.0
  describe file("/boot/grub/grub.cfg") do
    its("content") { should match /^set superusers=".*"$/ }
  end
  describe file("/boot/grub/grub.cfg") do
    its("content") { should match /^password/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_3.4_Require_Authentication_for_Single-User_Mode" do
  title "Require Authentication for Single-User Mode"
  desc  "Setting a password for the root user will force authentication in single user mode."
  impact 1.0
  describe bash("grep \"^root:[*\\!]:\" /etc/shadow") do
    its("stdout") { should_not match /.+/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_4.1_Restrict_Core_Dumps" do
  title "Restrict Core Dumps"
  desc  "A core dump is the memory of an executable program. It is generally used to determine why a program aborted. It can also be used to glean confidential information from a core file. The system provides the ability to set a soft limit for core dumps, but this can be overridden by the user."
  impact 1.0
  describe file("/etc/security/limits.conf") do
    its("content") { should match /^*\s+hard\s+core\s+0/ }
  end
  describe bash("sysctl fs.suid_dumpable").stdout.to_s.[](/^\s*\S+\s*=\s*(.+?)\s*(#.*)?$/, 1) do
    it { should eq "0" }
  end
  describe bash("initctl show-config apport | egrep \"^\\s*start\"") do
    its("exit_status") { should_not eq 0 }
  end
  describe bash("initctl show-config whoopsie | egrep \"^\\s*start\"") do
    its("exit_status") { should_not eq 0 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_4.2_Enable_XDNX_Support_on_32-bit_x86_Systems" do
  title "Enable XD/NX Support on 32-bit x86 Systems"
  desc  "Recent processors in the x86 family support the ability to prevent code execution on a per memory page basis. Generically and on AMD processors, this ability is called No Execute (NX), while on Intel processors it is called Execute Disable (XD). This ability can help prevent exploitation of buffer overflow vulnerabilities and should be activated whenever possible. Extra steps must be taken to ensure that this protection is enabled, particularly on 32-bit x86 systems. Other processors, such as Itanium and POWER, have included such support since inception and the standard kernel for those platforms supports the feature."
  impact 0.0
  describe bash("dmesg | grep NX") do
    its("stdout") { should match /NX \(Execute Disable\) protection: active/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_4.3_Enable_Randomized_Virtual_Memory_Region_Placement" do
  title "Enable Randomized Virtual Memory Region Placement"
  desc  "Set the system flag to force randomized virtual memory region placement."
  impact 1.0
  describe bash("sysctl kernel.randomize_va_space").stdout.to_s.[](/^\s*\S+\s*=\s*(.+?)\s*(#.*)?$/, 1) do
    it { should eq "2" }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_4.4_Disable_Prelink" do
  title "Disable Prelink"
  desc  "The prelinking feature changes binaries in an attempt to decrease their startup time."
  impact 1.0
  describe bash("dpkg -s prelink | egrep \"^Status:\\ install\"") do
    its("exit_status") { should_not eq 0 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_4.5_Activate_AppArmor" do
  title "Activate AppArmor"
  desc  "AppArmor provides a Mandatory Access Control (MAC) system that greatly augments the default Discretionary Access Control (DAC) model."
  impact 1.0
  describe bash("apparmor_status") do
    its("stdout") { should_not match /^0 profiles are loaded.$/ }
  end
  describe bash("apparmor_status") do
    its("stdout") { should match /^0 profiles are in complain mode.$/ }
  end
  describe bash("apparmor_status") do
    its("stdout") { should match /^0 processes are unconfined but have a profile defined.$/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_5.1.1_Ensure_NIS_is_not_installed" do
  title "Ensure NIS is not installed"
  desc  "The Network Information Service (NIS), formerly known as Yellow Pages, is a client-server directory service protocol used to distribute system configuration files."
  impact 1.0
  describe bash("dpkg -s nis | egrep \"^Status:\\ install\"") do
    its("exit_status") { should_not eq 0 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_5.1.2_Ensure_rsh_server_is_not_enabled" do
  title "Ensure rsh server is not enabled"
  desc  "The Berkeley rsh-server (rsh, rlogin, rcp) package contains legacy services that exchange credentials in clear-text."
  impact 1.0
  describe bash("egrep \"^shell\" /etc/inetd.conf") do
    its("exit_status") { should_not eq 0 }
  end
  describe bash("egrep \"^login\" /etc/inetd.conf") do
    its("exit_status") { should_not eq 0 }
  end
  describe bash("egrep \"^exec\" /etc/inetd.conf") do
    its("exit_status") { should_not eq 0 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_5.1.3_Ensure_rsh_client_is_not_installed" do
  title "Ensure rsh client is not installed"
  desc  "The rsh package contains the client commands for the rsh services."
  impact 1.0
  describe bash("dpkg -s rsh-client | egrep \"^Status:\\ install\"") do
    its("exit_status") { should_not eq 0 }
  end
  describe bash("dpkg -s rsh-redone-client | egrep \"^Status:\\ install\"") do
    its("exit_status") { should_not eq 0 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_5.1.4_Ensure_talk_server_is_not_enabled" do
  title "Ensure talk server is not enabled"
  desc  "The talk software makes it possible for users to send and receive messages across systems through a terminal session. The talk client (allows initiate of talk sessions) is installed by default."
  impact 1.0
  describe bash("egrep \"^talk\" /etc/inetd.conf") do
    its("exit_status") { should_not eq 0 }
  end
  describe bash("egrep \"^ntalk\" /etc/inetd.conf") do
    its("exit_status") { should_not eq 0 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_5.1.5_Ensure_talk_client_is_not_installed" do
  title "Ensure talk client is not installed"
  desc  "The talk software makes it possible for users to send and receive messages across systems through a terminal session."
  impact 1.0
  describe bash("dpkg -s talk | egrep \"^Status:\\ install\"") do
    its("exit_status") { should_not eq 0 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_5.1.6_Ensure_telnet_server_is_not_enabled" do
  title "Ensure telnet server is not enabled"
  desc  "The telnet-server package contains the telnet daemon, which accepts connections from users from other systems via the telnet protocol."
  impact 1.0
  describe bash("egrep \"^telnet\" /etc/inetd.conf") do
    its("exit_status") { should_not eq 0 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_5.1.7_Ensure_tftp-server_is_not_enabled" do
  title "Ensure tftp-server is not enabled"
  desc  "Trivial File Transfer Protocol (TFTP) is a simple file transfer protocol, typically used to automatically transfer configuration or boot machines from a boot server. The packages tftp and atftp are both used to define and support a TFTP server."
  impact 1.0
  describe bash("egrep \"^tftp\" /etc/inetd.conf") do
    its("exit_status") { should_not eq 0 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_5.1.8_Ensure_xinetd_is_not_enabled" do
  title "Ensure xinetd is not enabled"
  desc  "The eXtended InterNET Daemon (xinetd) is an open source super daemon that replaced the original inetd daemon. The xinetd daemon listens for well known services and dispatches the appropriate daemon to properly respond to service requests.\n                     Note: Several other services recommended to be disabled in this benchmark have xinetd versions as well, if xinetd is required in your environment ensure they are disabled in xinetd configuration as well."
  impact 1.0
  describe bash("initctl show-config xinetd | egrep \"^\\s*start\"") do
    its("exit_status") { should_not eq 0 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_5.2_Ensure_chargen_is_not_enabled" do
  title "Ensure chargen is not enabled"
  desc  "chargen is a network service that responds with 0 to 512 ASCII characters for each connection it receives. This service is intended for debugging and testing purposes. It is recommended that this service be disabled."
  impact 1.0
  describe bash("egrep \"^chargen\" /etc/inetd.conf") do
    its("exit_status") { should_not eq 0 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_5.3_Ensure_daytime_is_not_enabled" do
  title "Ensure daytime is not enabled"
  desc  "daytime is a network service that responds with the server's current date and time. This service is intended for debugging and testing purposes. It is recommended that this service be disabled."
  impact 1.0
  describe bash("chkconfig --list daytime | egrep \"on\"") do
    its("exit_status") { should_not eq 0 }
  end
  describe bash("egrep \"^daytime\" /etc/inetd.conf") do
    its("exit_status") { should_not eq 0 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_5.4_Ensure_echo_is_not_enabled" do
  title "Ensure echo is not enabled"
  desc  "echo is a network service that responds to clients with the data sent to it by the client. This service is intended for debugging and testing purposes. It is recommended that this service be disabled."
  impact 1.0
  describe bash("egrep \"^echo\" /etc/inetd.conf") do
    its("exit_status") { should_not eq 0 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_5.5_Ensure_discard_is_not_enabled" do
  title "Ensure discard is not enabled"
  desc  "discard is a network service that simply discards all data it receives. This service is intended for debugging and testing purposes. It is recommended that this service be disabled."
  impact 1.0
  describe bash("egrep \"^discard\" /etc/inetd.conf") do
    its("exit_status") { should_not eq 0 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_5.6_Ensure_time_is_not_enabled" do
  title "Ensure time is not enabled"
  desc  "time is a network service that responds with the server's current date and time as a 32 bit integer. This service is intended for debugging and testing purposes. It is recommended that this service be disabled."
  impact 1.0
  describe bash("egrep \"^time\" /etc/inetd.conf") do
    its("exit_status") { should_not eq 0 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_6.1_Ensure_the_X_Window_system_is_not_installed" do
  title "Ensure the X Window system is not installed"
  desc  "The X Window system provides a Graphical User Interface (GUI) where users can have multiple windows in which to run programs and various add on. The X Window system is typically used on desktops where users login, but not on servers where users typically do not login."
  impact 1.0
  describe bash("dpkg -l xserver-xorg-core*") do
    its("stdout") { should_not match /^ii/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_6.2_Ensure_Avahi_Server_is_not_enabled" do
  title "Ensure Avahi Server is not enabled"
  desc  "Avahi is a free zeroconf implementation, including a system for multicast DNS/DNS-SD service discovery. Avahi allows programs to publish and discover services and hosts running on a local network with no specific configuration. For example, a user can plug a computer into a network and Avahi automatically finds printers to print to, files to look at and people to talk to, as well as network services running on the machine."
  impact 1.0
  describe bash("initctl show-config avahi-daemon | egrep \"^\\s*start\"") do
    its("exit_status") { should_not eq 0 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_6.3_Ensure_print_server_is_not_enabled" do
  title "Ensure print server is not enabled"
  desc  "The Common Unix Print System (CUPS) provides the ability to print to both local and network printers. A system running CUPS can also accept print jobs from remote systems and print them to local printers. It also provides a web based remote administration capability."
  impact 0.0
  describe bash("initctl show-config cups | egrep \"^\\s*start\"") do
    its("exit_status") { should_not eq 0 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_6.4_Ensure_DHCP_Server_is_not_enabled" do
  title "Ensure DHCP Server is not enabled"
  desc  "The Dynamic Host Configuration Protocol (DHCP) is a service that allows machines to be dynamically assigned IP addresses."
  impact 1.0
  describe bash("initctl show-config isc-dhcp-server | egrep \"^\\s*start\"") do
    its("exit_status") { should_not eq 0 }
  end
  describe bash("initctl show-config isc-dhcp-server6 | egrep \"^\\s*start\"") do
    its("exit_status") { should_not eq 0 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_6.5_Configure_Network_Time_Protocol_NTP" do
  title "Configure Network Time Protocol (NTP)"
  desc  "The Network Time Protocol (NTP) is designed to synchronize system clocks across a variety of systems and use a source that is highly accurate. More information on NTP can be found at http://www.ntp.org. NTP can be configured to be a client and/or a server."
  impact 1.0
  describe file("/etc/ntp.conf") do
    its("content") { should match /^\s*restrict\s+-4\s+default(?=[^#]*\s+kod)(?=[^#]*\s+nomodify)(?=[^#]*\s+notrap)(?=[^#]*\s+nopeer)(?=[^#]*\s+noquery)(\s+kod|\s+nomodify|\s+notrap|\s+nopeer|\s+noquery)*\s*(?:#.*)?$/ }
  end
  describe file("/etc/ntp.conf") do
    its("content") { should match /^\s*restrict\s+-6\s+default(?=[^#]*\s+kod)(?=[^#]*\s+nomodify)(?=[^#]*\s+notrap)(?=[^#]*\s+nopeer)(?=[^#]*\s+noquery)(\s+kod|\s+nomodify|\s+notrap|\s+nopeer|\s+noquery)*\s*(?:#.*)?$/ }
  end
  describe file("/etc/ntp.conf") do
    its("content") { should match /^\s*server/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_6.6_Ensure_LDAP_is_not_enabled" do
  title "Ensure LDAP is not enabled"
  desc  "The Lightweight Directory Access Protocol (LDAP) was introduced as a replacement for NIS/YP. It is a service that provides a method for looking up information from a central database."
  impact 0.0
  describe bash("dpkg -s slapd | egrep \"^Status:\\ install\"") do
    its("exit_status") { should_not eq 0 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_6.7_Ensure_NFS_and_RPC_are_not_enabled" do
  title "Ensure NFS and RPC are not enabled"
  desc  "The Network File System (NFS) is one of the first and most widely distributed file systems in the UNIX environment. It provides the ability for systems to mount file systems of other servers through the network."
  impact 0.0
  describe bash("ls /etc/rc*.d/S*nfs-kernel-server") do
    its("exit_status") { should_not eq 0 }
  end
  describe bash("initctl show-config rpcbind-boot | egrep \"^\\s*start\"") do
    its("exit_status") { should_not eq 0 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_6.8_Ensure_DNS_Server_is_not_enabled" do
  title "Ensure DNS Server is not enabled"
  desc  "The Domain Name System (DNS) is a hierarchical naming system that maps names to IP addresses for computers, services and other resources connected to a network."
  impact 0.0
  describe bash("ls /etc/rc*.d/S*bind9") do
    its("exit_status") { should_not eq 0 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_6.9_Ensure_FTP_Server_is_not_enabled" do
  title "Ensure FTP Server is not enabled"
  desc  "The File Transfer Protocol (FTP) provides networked computers with the ability to transfer files."
  impact 0.0
  describe bash("initctl show-config vsftpd | egrep \"^\\s*start\"") do
    its("exit_status") { should_not eq 0 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_6.10_Ensure_HTTP_Server_is_not_enabled" do
  title "Ensure HTTP Server is not enabled"
  desc  "HTTP or web servers provide the ability to host web site content."
  impact 0.0
  describe bash("ls /etc/rc*.d/S*apache2") do
    its("exit_status") { should_not eq 0 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_6.11_Ensure_IMAP_and_POP_server_is_not_enabled" do
  title "Ensure IMAP and POP server is not enabled"
  desc  "Dovecot is an open source IMAP and POP3 server for Linux based systems."
  impact 0.0
  describe bash("initctl show-config dovecot | egrep \"^\\s*start\"") do
    its("exit_status") { should_not eq 0 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_6.12_Ensure_Samba_is_not_enabled" do
  title "Ensure Samba is not enabled"
  desc  "The Samba daemon allows system administrators to configure their Linux systems to share file systems and directories with Windows desktops. Samba will advertise the file systems and directories via the Small Message Block (SMB) protocol. Windows desktop users will be able to mount these directories and file systems as letter drives on their systems."
  impact 0.0
  describe bash("initctl show-config smbd | egrep \"^\\s*start\"") do
    its("exit_status") { should_not eq 0 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_6.13_Ensure_HTTP_Proxy_Server_is_not_enabled" do
  title "Ensure HTTP Proxy Server is not enabled"
  desc  "Squid is a standard proxy server used in many distributions and environments."
  impact 0.0
  describe bash("initctl show-config squid3 | egrep \"^\\s*start\"") do
    its("exit_status") { should_not eq 0 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_6.14_Ensure_SNMP_Server_is_not_enabled" do
  title "Ensure SNMP Server is not enabled"
  desc  "The Simple Network Management Protocol (SNMP) server is used to listen for SNMP commands from an SNMP management system, execute the commands or collect the information and then send results back to the requesting system."
  impact 0.0
  describe bash("ls /etc/rc*.d/S*snmpd") do
    its("exit_status") { should_not eq 0 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_6.15_Configure_Mail_Transfer_Agent_for_Local-Only_Mode" do
  title "Configure Mail Transfer Agent for Local-Only Mode"
  desc  "Mail Transfer Agents (MTA), such as sendmail and Postfix, are used to listen for incoming mail and transfer the messages to the appropriate user or mail server. If the system is not intended to be a mail server, it is recommended that the MTA be configured to only process local mail."
  impact 1.0
  describe bash("netstat -an | grep LIST | awk '($4 != \"127.0.0.1:25\" && $4 != \"::1:25\") { print $4 }' | grep \":25$\"") do
    its("stdout") { should_not match /.+/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_6.16_Ensure_rsync_service_is_not_enabled" do
  title "Ensure rsync service is not enabled"
  desc  "The rsyncd service can be used to synchronize files between systems over network links."
  impact 1.0
  describe file("/etc/default/rsync") do
    its("content") { should match /^RSYNC_ENABLE=false/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_6.17_Ensure_Biosdevname_is_not_enabled" do
  title "Ensure Biosdevname is not enabled"
  desc  "biosdevname is an external tool that works with the udev framework for naming devices.\n                 biosdevname uses three methods to determine NIC names :\n                    \n                \n                 PCI firmware spec.3.1 smbios (matches # after \"em\" to OEM # printed on board or housing) PCI IRQ Routing Table (uses # of NIC position in the device history). If the BIOS does not support biosdevname, no NICs' are re-named."
  impact 1.0
  describe bash("dpkg -s biosdevname | egrep \"^Status:\\ install\"") do
    its("exit_status") { should_not eq 0 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_7.1.1_Disable_IP_Forwarding" do
  title "Disable IP Forwarding"
  desc  "The net.ipv4.ip_forward flag is used to tell the server whether it can forward packets or not. If the server is not to be used as a router, set the flag to 0."
  impact 1.0
  describe bash("sysctl net.ipv4.ip_forward").stdout.to_s.[](/^\s*\S+\s*=\s*(.+?)\s*(#.*)?$/, 1) do
    it { should eq "0" }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_7.1.2_Disable_Send_Packet_Redirects" do
  title "Disable Send Packet Redirects"
  desc  "ICMP Redirects are used to send routing information to other hosts. As a host itself does not act as a router (in a host only configuration), there is no need to send redirects."
  impact 1.0
  describe bash("sysctl net.ipv4.conf.all.send_redirects").stdout.to_s.[](/^\s*\S+\s*=\s*(.+?)\s*(#.*)?$/, 1) do
    it { should eq "0" }
  end
  describe bash("sysctl net.ipv4.conf.default.send_redirects").stdout.to_s.[](/^\s*\S+\s*=\s*(.+?)\s*(#.*)?$/, 1) do
    it { should eq "0" }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_7.2.1_Disable_Source_Routed_Packet_Acceptance" do
  title "Disable Source Routed Packet Acceptance"
  desc  "In networking, source routing allows a sender to partially or fully specify the route packets take through a network. In contrast, non-source routed packets travel a path determined by routers in the network. In some cases, systems may not be routable or reachable from some locations (e.g. private addresses vs. Internet routable), and so source routed packets would need to be used."
  impact 1.0
  describe bash("sysctl net.ipv4.conf.all.accept_source_route").stdout.to_s.[](/^\s*\S+\s*=\s*(.+?)\s*(#.*)?$/, 1) do
    it { should eq "0" }
  end
  describe bash("sysctl net.ipv4.conf.default.accept_source_route").stdout.to_s.[](/^\s*\S+\s*=\s*(.+?)\s*(#.*)?$/, 1) do
    it { should eq "0" }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_7.2.2_Disable_ICMP_Redirect_Acceptance" do
  title "Disable ICMP Redirect Acceptance"
  desc  "ICMP redirect messages are packets that convey routing information and tell your host (acting as a router) to send packets via an alternate path. It is a way of allowing an outside routing device to update your system routing tables. By setting net.ipv4.conf.all.accept_redirects to 0, the system will not accept any ICMP redirect messages, and therefore, won't allow outsiders to update the system's routing tables."
  impact 1.0
  describe bash("sysctl net.ipv4.conf.all.accept_redirects").stdout.to_s.[](/^\s*\S+\s*=\s*(.+?)\s*(#.*)?$/, 1) do
    it { should eq "0" }
  end
  describe bash("sysctl net.ipv4.conf.default.accept_redirects").stdout.to_s.[](/^\s*\S+\s*=\s*(.+?)\s*(#.*)?$/, 1) do
    it { should eq "0" }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_7.2.3_Disable_Secure_ICMP_Redirect_Acceptance" do
  title "Disable Secure ICMP Redirect Acceptance"
  desc  "Secure ICMP redirects are the same as ICMP redirects, except they come from gateways listed on the default gateway list. It is assumed that these gateways are known to your system, and that they are likely to be secure."
  impact 1.0
  describe bash("sysctl net.ipv4.conf.all.secure_redirects").stdout.to_s.[](/^\s*\S+\s*=\s*(.+?)\s*(#.*)?$/, 1) do
    it { should eq "0" }
  end
  describe bash("sysctl net.ipv4.conf.default.secure_redirects").stdout.to_s.[](/^\s*\S+\s*=\s*(.+?)\s*(#.*)?$/, 1) do
    it { should match /0/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_7.2.4_Log_Suspicious_Packets" do
  title "Log Suspicious Packets"
  desc  "When enabled, this feature logs packets with un-routable source addresses to the kernel log."
  impact 1.0
  describe bash("sysctl net.ipv4.conf.all.log_martians").stdout.to_s.[](/^\s*\S+\s*=\s*(.+?)\s*(#.*)?$/, 1) do
    it { should eq "1" }
  end
  describe bash("sysctl net.ipv4.conf.default.log_martians").stdout.to_s.[](/^\s*\S+\s*=\s*(.+?)\s*(#.*)?$/, 1) do
    it { should eq "1" }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_7.2.5_Enable_Ignore_Broadcast_Requests" do
  title "Enable Ignore Broadcast Requests"
  desc  "Setting net.ipv4.icmp_echo_ignore_broadcasts to 1 will cause the system to ignore all ICMP echo and timestamp requests to broadcast and multicast addresses."
  impact 1.0
  describe bash("sysctl net.ipv4.icmp_echo_ignore_broadcasts").stdout.to_s.[](/^\s*\S+\s*=\s*(.+?)\s*(#.*)?$/, 1) do
    it { should eq "1" }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_7.2.6_Enable_Bad_Error_Message_Protection" do
  title "Enable Bad Error Message Protection"
  desc  "Setting icmp_ignore_bogus_error_responses to 1 prevents the kernel from logging bogus responses (RFC-1122 non-compliant) from broadcast reframes, keeping file systems from filling up with useless log messages."
  impact 1.0
  describe bash("sysctl net.ipv4.icmp_ignore_bogus_error_responses").stdout.to_s.[](/^\s*\S+\s*=\s*(.+?)\s*(#.*)?$/, 1) do
    it { should eq "1" }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_7.2.7_Enable_RFC-recommended_Source_Route_Validation" do
  title "Enable RFC-recommended Source Route Validation"
  desc  "Setting net.ipv4.conf.all.rp_filter and net.ipv4.conf.default.rp_filter to 1 forces the Linux kernel to utilize reverse path filtering on a received packet to determine if the packet was valid. Essentially, with reverse path filtering, if the return packet does not go out the same interface that the corresponding source packet came from, the packet is dropped (and logged if log_martians is set)."
  impact 1.0
  describe bash("sysctl net.ipv4.conf.all.rp_filter").stdout.to_s.[](/^\s*\S+\s*=\s*(.+?)\s*(#.*)?$/, 1) do
    it { should eq "1" }
  end
  describe bash("sysctl net.ipv4.conf.default.rp_filter").stdout.to_s.[](/^\s*\S+\s*=\s*(.+?)\s*(#.*)?$/, 1) do
    it { should eq "1" }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_7.2.8_Enable_TCP_SYN_Cookies" do
  title "Enable TCP SYN Cookies"
  desc  "When tcp_syncookies is set, the kernel will handle TCP SYN packets normally until the half-open connection queue is full, at which time, the SYN cookie functionality kicks in. SYN cookies work by not using the SYN queue at all. Instead, the kernel simply replies to the SYN with a SYN|ACK, but will include a specially crafted TCP sequence number that encodes the source and destination IP address and port number and the time the packet was sent. A legitimate connection would send the ACK packet of the three way handshake with the specially crafted sequence number. This allows the server to verify that it has received a valid response to a SYN cookie and allow the connection, even though there is no corresponding SYN in the queue."
  impact 1.0
  describe bash("sysctl net.ipv4.tcp_syncookies").stdout.to_s.[](/^\s*\S+\s*=\s*(.+?)\s*(#.*)?$/, 1) do
    it { should eq "1" }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_7.3.1_Disable_IPv6_Router_Advertisements" do
  title "Disable IPv6 Router Advertisements"
  desc  "This setting disables the systems ability to accept router advertisements"
  impact 0.0
  describe bash("sysctl net.ipv6.conf.all.accept_ra").stdout.to_s.[](/^\s*\S+\s*=\s*(.+?)\s*(#.*)?$/, 1) do
    it { should eq "0" }
  end
  describe bash("sysctl net.ipv6.conf.default.accept_ra").stdout.to_s.[](/^\s*\S+\s*=\s*(.+?)\s*(#.*)?$/, 1) do
    it { should eq "0" }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_7.3.2_Disable_IPv6_Redirect_Acceptance" do
  title "Disable IPv6 Redirect Acceptance"
  desc  "This setting prevents the system from accepting ICMP redirects. ICMP redirects tell the system about alternate routes for sending traffic."
  impact 0.0
  describe bash("sysctl net.ipv6.conf.all.accept_redirects").stdout.to_s.[](/^\s*\S+\s*=\s*(.+?)\s*(#.*)?$/, 1) do
    it { should eq "0" }
  end
  describe bash("sysctl net.ipv6.conf.default.accept_redirects").stdout.to_s.[](/^\s*\S+\s*=\s*(.+?)\s*(#.*)?$/, 1) do
    it { should eq "0" }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_7.3.3_Disable_IPv6" do
  title "Disable IPv6"
  desc  "Although IPv6 has many advantages over IPv4, few organizations have implemented IPv6."
  impact 0.0
  describe bash("ip addr | grep inet6") do
    its("stdout") { should_not match /.+/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_7.4.1_Install_TCP_Wrappers" do
  title "Install TCP Wrappers"
  desc  "TCP Wrappers provides a simple access list and standardized logging method for services capable of supporting it. In the past, services that were called from inetd and xinetd supported the use of tcp wrappers. As inetd and xinetd have been falling in disuse, any service that can support tcp wrappers will have the libwrap.so library attached to it."
  impact 1.0
  describe bash("dpkg -s tcpd | egrep \"^Status:\\ install\"") do
    its("exit_status") { should eq 0 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_7.4.2_Create_etchosts.allow" do
  title "Create /etc/hosts.allow"
  desc  "The /etc/hosts.allow file specifies which IP addresses are permitted to connect to the host. It is intended to be used in conjunction with the /etc/hosts.deny file."
  impact 0.0
end

control "xccdf_org.cisecurity.benchmarks_rule_7.4.3_Verify_Permissions_on_etchosts.allow" do
  title "Verify Permissions on /etc/hosts.allow"
  desc  "The /etc/hosts.allow file contains networking information that is used by many applications and therefore must be readable for these applications to operate."
  impact 1.0
  describe bash("ui=($(echo 0022 -n | fold -w1));sys=($(stat -L --format=\"%a\" /etc/hosts.allow | awk '{printf \"%04d\\n\", $0;}' | fold -w1));for (( i=0; i<4; i++ )); do echo -n $(( ${ui[$i]} & ${sys[$i]})); done;").stdout.to_s.[](/^(\d+)$/, 1) do
    it { should eq "0000" }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_7.4.4_Create_etchosts.deny" do
  title "Create /etc/hosts.deny"
  desc  "The /etc/hosts.deny file specifies which IP addresses are not permitted to connect to the host. It is intended to be used in conjunction with the /etc/hosts.allow file."
  impact 0.0
end

control "xccdf_org.cisecurity.benchmarks_rule_7.4.5_Verify_Permissions_on_etchosts.deny" do
  title "Verify Permissions on /etc/hosts.deny"
  desc  "The /etc/hosts.deny file contains network information that is used by many system applications and therefore must be readable for these applications to operate."
  impact 1.0
  describe bash("ui=($(echo 0022 -n | fold -w1));sys=($(stat -L --format=\"%a\" /etc/hosts.deny | awk '{printf \"%04d\\n\", $0;}' | fold -w1));for (( i=0; i<4; i++ )); do echo -n $(( ${ui[$i]} & ${sys[$i]})); done;").stdout.to_s.[](/^(\d+)$/, 1) do
    it { should eq "0000" }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_7.5.1_Disable_DCCP" do
  title "Disable DCCP"
  desc  "The Datagram Congestion Control Protocol (DCCP) is a transport layer protocol that supports streaming media and telephony. DCCP provides a way to gain access to congestion control, without having to do it at the application layer, but does not provide in-sequence delivery."
  impact 0.0
  describe bash("modprobe -n -v dccp") do
    its("stdout") { should match /^install \/bin\/true/ }
  end
  describe bash("lsmod | egrep \"^dccp\\s\"") do
    its("exit_status") { should_not eq 0 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_7.5.2_Disable_SCTP" do
  title "Disable SCTP"
  desc  "The Stream Control Transmission Protocol (SCTP) is a transport layer protocol used to support message oriented communication, with several streams of messages in one connection. It serves a similar function as TCP and UDP, incorporating features of both. It is message-oriented like UDP, and ensures reliable in-sequence transport of messages with congestion control like TCP."
  impact 0.0
  describe bash("modprobe -n -v sctp") do
    its("stdout") { should match /^install \/bin\/true/ }
  end
  describe bash("lsmod | egrep \"^sctp\\s\"") do
    its("exit_status") { should_not eq 0 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_7.5.3_Disable_RDS" do
  title "Disable RDS"
  desc  "The Reliable Datagram Sockets (RDS) protocol is a transport layer protocol designed to provide low-latency, high-bandwidth communications between cluster nodes. It was developed by the Oracle Corporation."
  impact 0.0
  describe bash("modprobe -n -v rds") do
    its("stdout") { should match /^install \/bin\/true/ }
  end
  describe bash("lsmod | egrep \"^rds\\s\"") do
    its("exit_status") { should_not eq 0 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_7.5.4_Disable_TIPC" do
  title "Disable TIPC"
  desc  "The Transparent Inter-Process Communication (TIPC) protocol is designed to provide communication between cluster nodes."
  impact 0.0
  describe bash("modprobe -n -v tipc") do
    its("stdout") { should match /^install \/bin\/true/ }
  end
  describe bash("lsmod | egrep \"^tipc\\s\"") do
    its("exit_status") { should_not eq 0 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_7.6_Deactivate_Wireless_Interfaces" do
  title "Deactivate Wireless Interfaces"
  desc  "Wireless networking is used when wired networks are unavailable. Ubuntu provides the nmcli interface which allows system administrators to configure and use wireless networks."
  impact 0.0
end

control "xccdf_org.cisecurity.benchmarks_rule_7.7_Ensure_Firewall_is_active" do
  title "Ensure Firewall is active"
  desc  "IPtables is an application that allows a system administrator to configure the IPv4 tables, chains and rules provided by the Linux kernel firewall. ufw was developed to ease IPtables firewall configuration."
  impact 1.0
  describe bash("ufw status") do
    its("stdout") { should match /^Status: active$/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_8.1.1.1_Configure_Audit_Log_Storage_Size" do
  title "Configure Audit Log Storage Size"
  desc  "Configure the maximum size of the audit log file. Once the log reaches the maximum size, it will be rotated and a new log file will be started."
  impact 0.0
end

control "xccdf_org.cisecurity.benchmarks_rule_8.1.1.2_Disable_System_on_Audit_Log_Full" do
  title "Disable System on Audit Log Full"
  desc  "The auditd daemon can be configured to halt the system when the audit logs are full."
  impact 0.0
  describe bash("awk '/^ *space_left_action/ { print $0 }' /etc/audit/auditd.conf").stdout.to_s.[](/^\s*\S+\s*=\s*(.+?)\s*(#.*)?$/, 1) do
    it { should eq "email" }
  end
  describe bash("awk '/^ *action_mail_acct/ { print $0 }' /etc/audit/auditd.conf").stdout.to_s.[](/^\s*\S+\s*=\s*(.+?)\s*(#.*)?$/, 1) do
    it { should eq "root" }
  end
  describe bash("awk '/^ *admin_space_left_action/ { print $0 }' /etc/audit/auditd.conf").stdout.to_s.[](/^\s*\S+\s*=\s*(.+?)\s*(#.*)?$/, 1) do
    it { should eq "halt" }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_8.1.1.3_Keep_All_Auditing_Information" do
  title "Keep All Auditing Information"
  desc  "Normally, auditd will hold 4 logs of maximum log file size before deleting older log files."
  impact 1.0
  describe file("/etc/audit/auditd.conf") do
    its("content") { should match /^max_log_file_action\s*=\s*keep_logs$/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_8.1.2_Install_and_Enable_auditd_Service" do
  title "Install and Enable auditd Service"
  desc  "Install and turn on the auditd daemon to record system events."
  impact 1.0
  describe bash("dpkg -s auditd | egrep \"^Status:\\ install\"") do
    its("exit_status") { should eq 0 }
  end
  describe bash("ls /etc/rc*.d/S*auditd") do
    its("exit_status") { should eq 0 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_8.1.3_Enable_Auditing_for_Processes_That_Start_Prior_to_auditd" do
  title "Enable Auditing for Processes That Start Prior to auditd"
  desc  "Configure grub or lilo so that processes that are capable of being audited can be audited even if they start up prior to auditd startup."
  impact 1.0
  describe bash("grep \"^\\s*linux\\s\" /boot/grub/grub.cfg | grep -v \"audit=1\"") do
    its("stdout") { should_not match /.+/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_8.1.4_Record_Events_That_Modify_Date_and_Time_Information" do
  title "Record Events That Modify Date and Time Information"
  desc  "Capture events where the system date and/or time has been modified. The parameters in this section are set to determine if the adjtimex (tune kernel clock), settimeofday (Set time, using timeval and timezone structures) stime (using seconds since 1/1/1970) or clock_settime (allows for the setting of several internal clocks and timers) system calls have been executed and always write an audit record to the /var/log/audit.log file upon exit, tagging the records with the identifier \"time-change\""
  impact 1.0
  describe file("/etc/audit/audit.rules") do
    its("content") { should match /^ *-a +(always,exit|exit,always) +-F +arch=b32 +-S +adjtimex +-S +settimeofday +-S +stime +-k +time-change$/ }
  end
  describe file("/etc/audit/audit.rules") do
    its("content") { should match /^ *-a +(always,exit|exit,always) +-F +arch=b32 +-S +clock_settime +-k +time-change$/ }
  end
  describe file("/etc/audit/audit.rules") do
    its("content") { should match /^ *-w +\/etc\/localtime +-p +wa +-k +time-change$/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_8.1.5_Record_Events_That_Modify_UserGroup_Information" do
  title "Record Events That Modify User/Group Information"
  desc  "Record events affecting the group, passwd (user IDs), shadow and gshadow (passwords) or /etc/security/opasswd (old passwords, based on remember parameter in the PAM configuration) files. The parameters in this section will watch the files to see if they have been opened for write or have had attribute changes (e.g. permissions) and tag them with the identifier \"identity\" in the audit log file."
  impact 1.0
  describe file("/etc/audit/audit.rules") do
    its("content") { should match /^\s*-w \/etc\/group -p wa -k identity/ }
  end
  describe file("/etc/audit/audit.rules") do
    its("content") { should match /^\s*-w \/etc\/passwd -p wa -k identity/ }
  end
  describe file("/etc/audit/audit.rules") do
    its("content") { should match /^\s*-w \/etc\/gshadow -p wa -k identity/ }
  end
  describe file("/etc/audit/audit.rules") do
    its("content") { should match /^\s*-w \/etc\/shadow -p wa -k identity/ }
  end
  describe file("/etc/audit/audit.rules") do
    its("content") { should match /^\s*-w \/etc\/security\/opasswd -p wa -k identity/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_8.1.6_Record_Events_That_Modify_the_Systems_Network_Environment" do
  title "Record Events That Modify the System's Network Environment"
  desc  "Record changes to network environment files or system calls. The below parameters monitor the sethostname (set the systems host name) or setdomainname (set the systems domainname) system calls, and write an audit event on system call exit. The other parameters monitor the /etc/issue and /etc/issue.net files (messages displayed pre-login), /etc/hosts (file containing host names and associated IP addresses) and /etc/network (directory containing network interface scripts and configurations) files."
  impact 1.0
  describe file("/etc/audit/audit.rules") do
    its("content") { should match /^ *-a +(always,exit|exit,always) +-F +arch=b32 +-S +sethostname +-S +setdomainname +-k +system-locale$/ }
  end
  describe file("/etc/audit/audit.rules") do
    its("content") { should match /^ *-w +\/etc\/issue +-p +wa +-k +system-locale$/ }
  end
  describe file("/etc/audit/audit.rules") do
    its("content") { should match /^ *-w +\/etc\/issue.net +-p +wa +-k +system-locale$/ }
  end
  describe file("/etc/audit/audit.rules") do
    its("content") { should match /^ *-w +\/etc\/hosts +-p +wa +-k +system-locale$/ }
  end
  describe file("/etc/audit/audit.rules") do
    its("content") { should match /^ *-w +\/etc\/network +-p +wa +-k +system-locale$/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_8.1.7_Record_Events_That_Modify_the_Systems_Mandatory_Access_Controls" do
  title "Record Events That Modify the System's Mandatory Access Controls"
  desc  "Monitor SELinux mandatory access controls. The parameters below monitor any write access (potential additional, deletion or modification of files in the directory) or attribute changes to the /etc/selinux directory."
  impact 1.0
  describe file("/etc/audit/audit.rules") do
    its("content") { should match /^\s*-w \/etc\/selinux\/ -p wa -k MAC-policy/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_8.1.8_Collect_Login_and_Logout_Events" do
  title "Collect Login and Logout Events"
  desc  "Monitor login and logout events. The parameters below track changes to files associated with login/logout events. The file /var/log/faillog tracks failed events from login. The file /var/log/lastlog maintain records of the last time a user successfully logged in. The file /var/log/tallylog maintains records of failures via the pam_tally2 module"
  impact 1.0
  describe file("/etc/audit/audit.rules") do
    its("content") { should match /^\s*-w \/var\/log\/faillog -p wa -k logins/ }
  end
  describe file("/etc/audit/audit.rules") do
    its("content") { should match /^\s*-w \/var\/log\/lastlog -p wa -k logins/ }
  end
  describe file("/etc/audit/audit.rules") do
    its("content") { should match /^\s*-w \/var\/log\/tallylog -p wa -k logins/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_8.1.9_Collect_Session_Initiation_Information" do
  title "Collect Session Initiation Information"
  desc  "Monitor session initiation events. The parameters in this section track changes to the files associated with session events. The file /var/run/utmp file tracks all currently logged in users. The /var/log/wtmp file tracks logins, logouts, shutdown and reboot events. All audit records will be tagged with the identifier \"session.\" The file /var/log/btmp keeps track of failed login attempts and can be read by entering the command /usr/bin/last -f /var/log/btmp. All audit records will be tagged with the identifier \"logins.\""
  impact 1.0
  describe file("/etc/audit/audit.rules") do
    its("content") { should match /^\s*-w \/var\/run\/utmp -p wa -k session/ }
  end
  describe file("/etc/audit/audit.rules") do
    its("content") { should match /^\s*-w \/var\/log\/wtmp -p wa -k session/ }
  end
  describe file("/etc/audit/audit.rules") do
    its("content") { should match /^\s*-w \/var\/log\/btmp -p wa -k session/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_8.1.10_Collect_Discretionary_Access_Control_Permission_Modification_Events" do
  title "Collect Discretionary Access Control Permission Modification Events"
  desc  "Monitor changes to file permissions, attributes, ownership and group. The parameters in this section track changes for system calls that affect file permissions and attributes. The chmod, fchmod and fchmodat system calls affect the permissions associated with a file. The chown, fchown, fchownat and lchown system calls affect owner and group attributes on a file. The setxattr, lsetxattr, fsetxattr (set extended file attributes) and removexattr, lremovexattr, fremovexattr (remove extended file attributes) control extended file attributes. In all cases, an audit record will only be written for non-system userids (auid >= 500) and will ignore Daemon events (auid = 4294967295). All audit records will be tagged with the identifier \"perm_mod.\""
  impact 1.0
  describe file("/etc/audit/audit.rules") do
    its("content") { should match /^ *-a +(always,exit|exit,always) +-F +arch=b32 +-S +chmod +-S +fchmod +-S +fchmodat +-F +auid>=500 +-F +auid!=4294967295 +-k +perm_mod$/ }
  end
  describe file("/etc/audit/audit.rules") do
    its("content") { should match /^ *-a +(always,exit|exit,always) +-F +arch=b32 +-S +chown +-S +fchown +-S +fchownat +-S +lchown +-F +auid>=500 +-F +auid!=4294967295 +-k +perm_mod$/ }
  end
  describe file("/etc/audit/audit.rules") do
    its("content") { should match /^ *-a +(always,exit|exit,always) +-F +arch=b32 +-S +setxattr +-S +lsetxattr +-S +fsetxattr +-S +removexattr +-S +lremovexattr +-S +fremovexattr +-F +auid>=500 +-F +auid!=4294967295 +-k +perm_mod$/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_8.1.11_Collect_Unsuccessful_Unauthorized_Access_Attempts_to_Files" do
  title "Collect Unsuccessful Unauthorized Access Attempts to Files"
  desc  "Monitor for unsuccessful attempts to access files. The parameters below are associated with system calls that control creation (creat), opening (open, openat) and truncation (truncate, ftruncate) of files. An audit log record will only be written if the user is a non-privileged user (auid > = 500), is not a Daemon event (auid=4294967295) and if the system call returned EACCES (permission denied to the file) or EPERM (some other permanent error associated with the specific system call). All audit records will be tagged with the identifier \"access.\""
  impact 1.0
  describe file("/etc/audit/audit.rules") do
    its("content") { should match /^ *-a +(always,exit|exit,always) +-F +arch=b32 +-S +creat +-S +open +-S +openat +-S +truncate +-S +ftruncate +-F +exit=-EACCES +-F +auid>=500 +-F +auid!=4294967295 +-k +access$/ }
  end
  describe file("/etc/audit/audit.rules") do
    its("content") { should match /^ *-a +(always,exit|exit,always) +-F +arch=b32 +-S +creat +-S +open +-S +openat +-S +truncate +-S +ftruncate +-F +exit=-EPERM +-F +auid>=500 +-F +auid!=4294967295 +-k +access$/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_8.1.12_Collect_Use_of_Privileged_Commands" do
  title "Collect Use of Privileged Commands"
  desc  "Monitor privileged programs (those that have the setuid and/or setgid bit set on execution) to determine if unprivileged users are running these commands."
  impact 1.0
  describe bash("for i in `df --local -P|awk {'if (NR!=1) print $6'}|xargs -I '{}' find '{}' -xdev -type f \\( -perm -2000 -o -perm -4000 \\)`; do egrep -q \"^ *\\-a +(always,exit|exit,always) +\\-F +path=$i +\\-F +perm=x +\\-F +auid>=500 +\\-F +auid!=4294967295 +-k +privileged$\" /etc/audit/audit.rules;if [ $? -ne 0 ]; then echo $i use is not properly audited;fi;done") do
    its("stdout") { should_not match /.+/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_8.1.13_Collect_Successful_File_System_Mounts" do
  title "Collect Successful File System Mounts"
  desc  "Monitor the use of the mount system call. The mount (and umount) system call controls the mounting and unmounting of file systems. The parameters below configure the system to create an audit record when the mount system call is used by a non-privileged user"
  impact 1.0
  describe file("/etc/audit/audit.rules") do
    its("content") { should match /^ *-a +(always,exit|exit,always) +-F +arch=b32 +-S +mount +-F +auid>=500 +-F +auid!=4294967295 +-k +mounts$/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_8.1.14_Collect_File_Deletion_Events_by_User" do
  title "Collect File Deletion Events by User"
  desc  "Monitor the use of system calls associated with the deletion or renaming of files and file attributes. This configuration statement sets up monitoring for the unlink (remove a file), unlinkat (remove a file attribute), rename (rename a file) and renameat (rename a file attribute) system calls and tags them with the identifier \"delete\"."
  impact 1.0
  describe file("/etc/audit/audit.rules") do
    its("content") { should match /^ *-a +(always,exit|exit,always) +-F +arch=b32 +-S +unlink +-S +unlinkat +-S +rename +-S +renameat +-F +auid>=500 +-F +auid!=4294967295 +-k +delete$/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_8.1.15_Collect_Changes_to_System_Administration_Scope_sudoers" do
  title "Collect Changes to System Administration Scope (sudoers)"
  desc  "Monitor scope changes for system administrations. If the system has been properly configured to force system administrators to log in as themselves first and then use the sudo command to execute privileged commands, it is possible to monitor changes in scope. The file /etc/sudoers will be written to when the file or its attributes have changed. The audit records will be tagged with the identifier \"scope.\""
  impact 1.0
  describe file("/etc/audit/audit.rules") do
    its("content") { should match /^\s*-w \/etc\/sudoers -p wa -k scope/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_8.1.16_Collect_System_Administrator_Actions_sudolog" do
  title "Collect System Administrator Actions (sudolog)"
  desc  "Monitor the sudo log file. If the system has been properly configured to disable the use of the su command and force all administrators to have to log in first and then use sudo to execute privileged commands, then all administrator commands will be logged to /var/log/sudo.log. Any time a command is executed, an audit event will be triggered as the /var/log/sudo.log file will be opened for write and the executed administration command will be written to the log."
  impact 1.0
  describe file("/etc/audit/audit.rules") do
    its("content") { should match /^\s*-w \/var\/log\/sudo.log -p wa -k actions/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_8.1.17_Collect_Kernel_Module_Loading_and_Unloading" do
  title "Collect Kernel Module Loading and Unloading"
  desc  "Monitor the loading and unloading of kernel modules. The programs insmod (install a kernel module), rmmod (remove a kernel module), and modprobe (a more sophisticated program to load and unload modules, as well as some other features) control loading and unloading of modules. The init_module (load a module) and delete_module (delete a module) system calls control loading and unloading of modules. Any execution of the loading and unloading module programs and system calls will trigger an audit record with an identifier of \"modules\"."
  impact 1.0
  describe file("/etc/audit/audit.rules") do
    its("content") { should match /^ *-w +\/sbin\/insmod +-p +x +-k +modules$/ }
  end
  describe file("/etc/audit/audit.rules") do
    its("content") { should match /^ *-w +\/sbin\/rmmod +-p +x +-k +modules$/ }
  end
  describe file("/etc/audit/audit.rules") do
    its("content") { should match /^ *-w +\/sbin\/modprobe +-p +x +-k +modules$/ }
  end
  describe file("/etc/audit/audit.rules") do
    its("content") { should match /^ *-a +(always,exit|exit,always) +-F +arch=b32 +-S +init_module +-S +delete_module +-k +modules$/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_8.1.18_Make_the_Audit_Configuration_Immutable" do
  title "Make the Audit Configuration Immutable"
  desc  "Set system audit so that audit rules cannot be modified with auditctl. Setting the flag \"-e 2\" forces audit to be put in immutable mode. Audit changes can only be made on system reboot."
  impact 1.0
  describe file("/etc/audit/audit.rules") do
    its("content") { should match /^\s*-e 2/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_8.2.1_Install_the_rsyslog_package" do
  title "Install the rsyslog package"
  desc  "The rsyslog package is a third party package that provides many enhancements to syslog, such as multi-threading, TCP communication, message filtering and data base support."
  impact 1.0
  describe bash("dpkg -s rsyslog | egrep \"^Status:\\ install\"") do
    its("exit_status") { should eq 0 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_8.2.2_Ensure_the_rsyslog_Service_is_activated" do
  title "Ensure the rsyslog Service is activated"
  desc  "Once the rsyslog package is installed it needs to be activated."
  impact 1.0
  describe bash("initctl show-config rsyslog | egrep \"^\\s*start\"") do
    its("exit_status") { should eq 0 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_8.2.3_Configure_etcrsyslog.conf" do
  title "Configure /etc/rsyslog.conf"
  desc  "The /etc/rsyslog.conf file specifies rules for logging and which files are to be used to log certain classes of messages."
  impact 0.0
end

control "xccdf_org.cisecurity.benchmarks_rule_8.2.4_Create_and_Set_Permissions_on_rsyslog_Log_Files" do
  title "Create and Set Permissions on rsyslog Log Files"
  desc  "A log file must already exist for rsyslog to be able to write to it."
  impact 1.0
  describe bash("find `awk '/^ *[^\#$]/ { print $2 }' /etc/rsyslog.conf /etc/rsyslog.d/* | egrep -o \"/.*\"` ! -user root") do
    its("stdout") { should_not match /.+/ }
  end
  describe bash("find `awk '/^ *[^\#$]/ { print $2 }' /etc/rsyslog.conf /etc/rsyslog.d/* | egrep -o \"/.*\"` -perm /o+rwx") do
    its("stdout") { should_not match /.+/ }
  end
  describe bash("find `awk '/^ *[^\#$]/ { print $2 }' /etc/rsyslog.conf /etc/rsyslog.d/* | egrep -o \"/.*\"` -perm /g+wx") do
    its("stdout") { should_not match /.+/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_8.2.5_Configure_rsyslog_to_Send_Logs_to_a_Remote_Log_Host" do
  title "Configure rsyslog to Send Logs to a Remote Log Host"
  desc  "The rsyslog utility supports the ability to send logs it gathers to a remote log host running syslogd(8) or to receive messages from remote hosts, reducing administrative overhead."
  impact 1.0
  describe file("/etc/rsyslog.conf") do
    its("content") { should match /^\*\.\*\s+@/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_8.2.6_Accept_Remote_rsyslog_Messages_Only_on_Designated_Log_Hosts" do
  title "Accept Remote rsyslog Messages Only on Designated Log Hosts"
  desc  "By default, rsyslog does not listen for log messages coming in from remote systems. The ModLoad tells rsyslog to load the imtcp.so module so it can listen over a network via TCP. The InputTCPServerRun option instructs rsyslogd to listen on the specified TCP port."
  impact 0.0
end

control "xccdf_org.cisecurity.benchmarks_rule_8.3.1_Install_AIDE" do
  title "Install AIDE"
  desc  "In some installations, AIDE is not installed automatically."
  impact 1.0
  describe bash("dpkg -s aide | egrep \"^Status:\\ install\"") do
    its("exit_status") { should eq 0 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_8.3.2_Implement_Periodic_Execution_of_File_Integrity" do
  title "Implement Periodic Execution of File Integrity"
  desc  "Implement periodic file checking, in compliance with site policy."
  impact 1.0
  describe bash("crontab -u root -l") do
    its("stdout") { should match /^[^#].*aide.*(-C|--check)/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_8.4_Configure_logrotate" do
  title "Configure logrotate"
  desc  "The system includes the capability of rotating log files regularly to avoid filling up the system with logs or making the logs unmanageable large. The file /etc/logrotate.d/rsyslog is the configuration file used to rotate log files created by rsyslog."
  impact 0.0
end

control "xccdf_org.cisecurity.benchmarks_rule_9.1.1_Enable_cron_Daemon" do
  title "Enable cron Daemon"
  desc  "The cron daemon is used to execute batch jobs on the system."
  impact 1.0
  describe bash("initctl show-config cron | egrep \"^\\s*start\"") do
    its("exit_status") { should eq 0 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_9.1.2_Set_UserGroup_Owner_and_Permission_on_etccrontab" do
  title "Set User/Group Owner and Permission on /etc/crontab"
  desc  "The /etc/crontab file is used by cron to control its own jobs. The commands in this item make sure that root is the user and group owner of the file and that only the owner can access the file."
  impact 1.0
  describe bash("stat -c \"%u %g\" /etc/crontab") do
    its("stdout") { should match /0 0/ }
  end
  describe bash("ui=($(echo 0077 -n | fold -w1));sys=($(stat -L --format=\"%a\" /etc/crontab | awk '{printf \"%04d\\n\", $0;}' | fold -w1));for (( i=0; i<4; i++ )); do echo -n $(( ${ui[$i]} & ${sys[$i]})); done;").stdout.to_s.[](/^(\d+)$/, 1) do
    it { should eq "0000" }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_9.1.3_Set_UserGroup_Owner_and_Permission_on_etccron.hourly" do
  title "Set User/Group Owner and Permission on /etc/cron.hourly"
  desc  "This directory contains system cron jobs that need to run on an hourly basis. The files in this directory cannot be manipulated by the crontab command, but are instead edited by system administrators using a text editor. The commands below restrict read/write and search access to user and group root, preventing regular users from accessing this directory."
  impact 1.0
  describe bash("stat -c \"%u %g\" /etc/cron.hourly") do
    its("stdout") { should match /0 0/ }
  end
  describe bash("ui=($(echo 0077 -n | fold -w1));sys=($(stat -L --format=\"%a\" /etc/cron.hourly | awk '{printf \"%04d\\n\", $0;}' | fold -w1));for (( i=0; i<4; i++ )); do echo -n $(( ${ui[$i]} & ${sys[$i]})); done;").stdout.to_s.[](/^(\d+)$/, 1) do
    it { should eq "0000" }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_9.1.4_Set_UserGroup_Owner_and_Permission_on_etccron.daily" do
  title "Set User/Group Owner and Permission on /etc/cron.daily"
  desc  "The /etc/cron.daily directory contains system cron jobs that need to run on a daily basis. The files in this directory cannot be manipulated by the crontab command, but are instead edited by system administrators using a text editor. The commands below restrict read/write and search access to user and group root, preventing regular users from accessing this directory."
  impact 1.0
  describe bash("stat -c \"%u %g\" /etc/cron.daily") do
    its("stdout") { should match /0 0/ }
  end
  describe bash("ui=($(echo 0077 -n | fold -w1));sys=($(stat -L --format=\"%a\" /etc/cron.daily | awk '{printf \"%04d\\n\", $0;}' | fold -w1));for (( i=0; i<4; i++ )); do echo -n $(( ${ui[$i]} & ${sys[$i]})); done;").stdout.to_s.[](/^(\d+)$/, 1) do
    it { should eq "0000" }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_9.1.5_Set_UserGroup_Owner_and_Permission_on_etccron.weekly" do
  title "Set User/Group Owner and Permission on /etc/cron.weekly"
  desc  "The /etc/cron.weekly directory contains system cron jobs that need to run on a weekly basis. The files in this directory cannot be manipulated by the crontab command, but are instead edited by system administrators using a text editor. The commands below restrict read/write and search access to user and group root, preventing regular users from accessing this directory."
  impact 1.0
  describe bash("stat -c \"%u %g\" /etc/cron.weekly") do
    its("stdout") { should match /0 0/ }
  end
  describe bash("ui=($(echo 0077 -n | fold -w1));sys=($(stat -L --format=\"%a\" /etc/cron.weekly | awk '{printf \"%04d\\n\", $0;}' | fold -w1));for (( i=0; i<4; i++ )); do echo -n $(( ${ui[$i]} & ${sys[$i]})); done;").stdout.to_s.[](/^(\d+)$/, 1) do
    it { should eq "0000" }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_9.1.6_Set_UserGroup_Owner_and_Permission_on_etccron.monthly" do
  title "Set User/Group Owner and Permission on /etc/cron.monthly"
  desc  "The /etc/cron.monthly directory contains system cron jobs that need to run on a monthly basis. The files in this directory cannot be manipulated by the crontab command, but are instead edited by system administrators using a text editor. The commands below restrict read/write and search access to user and group root, preventing regular users from accessing this directory."
  impact 1.0
  describe bash("stat -c \"%u %g\" /etc/cron.monthly") do
    its("stdout") { should match /0 0/ }
  end
  describe bash("ui=($(echo 0077 -n | fold -w1));sys=($(stat -L --format=\"%a\" /etc/cron.monthly | awk '{printf \"%04d\\n\", $0;}' | fold -w1));for (( i=0; i<4; i++ )); do echo -n $(( ${ui[$i]} & ${sys[$i]})); done;").stdout.to_s.[](/^(\d+)$/, 1) do
    it { should eq "0000" }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_9.1.7_Set_UserGroup_Owner_and_Permission_on_etccron.d" do
  title "Set User/Group Owner and Permission on /etc/cron.d"
  desc  "The /etc/cron.d directory contains system cron jobs that need to run in a similar manner to the hourly, daily weekly and monthly jobs from /etc/crontab, but require more granular control as to when they run. The files in this directory cannot be manipulated by the crontab command, but are instead edited by system administrators using a text editor. The commands below restrict read/write and search access to user and group root, preventing regular users from accessing this directory."
  impact 1.0
  describe bash("stat -c \"%u %g\" /etc/cron.d") do
    its("stdout") { should match /0 0/ }
  end
  describe bash("ui=($(echo 0077 -n | fold -w1));sys=($(stat -L --format=\"%a\" /etc/cron.d | awk '{printf \"%04d\\n\", $0;}' | fold -w1));for (( i=0; i<4; i++ )); do echo -n $(( ${ui[$i]} & ${sys[$i]})); done;").stdout.to_s.[](/^(\d+)$/, 1) do
    it { should eq "0000" }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_9.1.8_Restrict_atcron_to_Authorized_Users" do
  title "Restrict at/cron to Authorized Users"
  desc  "Configure /etc/cron.allow and /etc/at.allow to allow specific users to use these services. If /etc/cron.allow or /etc/at.allow do not exist, then /etc/at.deny and /etc/cron.deny are checked. Any user not specifically defined in those files is allowed to use at and cron. By removing the files, only users in /etc/cron.allow and /etc/at.allow are allowed to use at and cron. Note that even though a given user is not listed in cron.allow, cron jobs can still be run as that user. The cron.allow file only controls administrative access to the crontab command for scheduling and modifying cron jobs."
  impact 1.0
  describe bash("stat /etc/cron.deny") do
    its("exit_status") { should_not eq 0 }
  end
  describe bash("stat -c \"%u %g\" /etc/cron.allow") do
    its("stdout") { should match /0 0/ }
  end
  describe bash("ui=($(echo 0077 -n | fold -w1));sys=($(stat -L --format=\"%a\" /etc/cron.allow | awk '{printf \"%04d\\n\", $0;}' | fold -w1));for (( i=0; i<4; i++ )); do echo -n $(( ${ui[$i]} & ${sys[$i]})); done;").stdout.to_s.[](/^(\d+)$/, 1) do
    it { should eq "0000" }
  end
  describe bash("stat /etc/at.deny") do
    its("exit_status") { should_not eq 0 }
  end
  describe bash("stat -c \"%u %g\" /etc/at.allow") do
    its("stdout") { should match /0 0/ }
  end
  describe bash("ui=($(echo 0077 -n | fold -w1));sys=($(stat -L --format=\"%a\" /etc/at.allow | awk '{printf \"%04d\\n\", $0;}' | fold -w1));for (( i=0; i<4; i++ )); do echo -n $(( ${ui[$i]} & ${sys[$i]})); done;").stdout.to_s.[](/^(\d+)$/, 1) do
    it { should eq "0000" }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_9.2.1_Set_Password_Creation_Requirement_Parameters_Using_pam_cracklib" do
  title "Set Password Creation Requirement Parameters Using pam_cracklib"
  desc  "The pam_cracklib module checks the strength of passwords. It performs checks such as making sure a password is not a dictionary word, it is a certain length, contains a mix of characters (e.g. alphabet, numeric, other) and more. The following are definitions of the pam_cracklib.so options.\n                    \n                        \n                             retry=3 - Allow 3 tries before sending back a failure.\n                         minlen=14 - password must be 14 characters or more\n                         dcredit=-1 - provide at least one digit\n                         ucredit=-1 - provide at least one uppercase character\n                         ocredit=-1 - provide at least one special character\n                         lcredit=-1 - provide at least one lowercase character\n                     The setting shown above is one possible policy. Alter these values to conform to your own organization's password policies."
  impact 1.0
  describe bash("egrep -v \"^[[:space:]]*#\" /etc/pam.d/common-password | egrep \"pam_cracklib.so\" | sed -e 's/#.*//' | tr -s '\\t ' '\\n' | awk -F = '/^retry/ { if ($2 <= 3) print $2 }'") do
    its("stdout") { should match /.+/ }
  end
  describe bash("egrep -v \"^[[:space:]]*#\" /etc/pam.d/common-password | egrep \"pam_cracklib.so\" | sed -e 's/#.*//' | tr -s '\\t ' '\\n' | awk -F = '/^minlen/ { if ($2 >= 14) print $2 }'") do
    its("stdout") { should match /.+/ }
  end
  describe bash("egrep -v \"^[[:space:]]*#\" /etc/pam.d/common-password | egrep \"pam_cracklib.so\" | sed -e 's/#.*//' | tr -s '\\t ' '\\n' | awk -F = '/^dcredit/ { if ($2 <= -1) print $2 }'") do
    its("stdout") { should match /.+/ }
  end
  describe bash("egrep -v \"^[[:space:]]*#\" /etc/pam.d/common-password | egrep \"pam_cracklib.so\" | sed -e 's/#.*//' | tr -s '\\t ' '\\n' | awk -F = '/^ucredit/ { if ($2 <= -1) print $2 }'") do
    its("stdout") { should match /.+/ }
  end
  describe bash("egrep -v \"^[[:space:]]*#\" /etc/pam.d/common-password | egrep \"pam_cracklib.so\" | sed -e 's/#.*//' | tr -s '\\t ' '\\n' | awk -F = '/^lcredit/ { if ($2 <= -1) print $2 }'") do
    its("stdout") { should match /.+/ }
  end
  describe bash("egrep -v \"^[[:space:]]*#\" /etc/pam.d/common-password | egrep \"pam_cracklib.so\" | sed -e 's/#.*//' | tr -s '\\t ' '\\n' | awk -F = '/^ocredit/ { if ($2 <= -1) print $2 }'") do
    its("stdout") { should match /.+/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_9.2.2_Set_Lockout_for_Failed_Password_Attempts" do
  title "Set Lockout for Failed Password Attempts"
  desc  "Lock out users after n unsuccessful consecutive login attempts. The first sets of changes are made to the PAM configuration file /etc/pam.d/login. The second set of changes are applied to the program specific PAM configuration file. The second set of changes must be applied to each program that will lock out users. Check the documentation for each secondary program for instructions on how to configure them to work with PAM. Set the lockout number to the policy in effect at your site."
  impact 0.0
  describe file("/etc/pam.d/login") do
    its("content") { should match /^auth\s+required\s+pam_tally2.so\s+onerr=fail\s+audit\s+silent\s+deny=5\s+unlock_time=900$/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_9.2.3_Limit_Password_Reuse" do
  title "Limit Password Reuse"
  desc  "The /etc/security/opasswd file stores the users' old passwords and can be checked to ensure that users are not recycling recent passwords."
  impact 1.0
  describe file("/etc/pam.d/common-password") do
    its("content") { should match /^[^#]*remember/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_9.3.1_Set_SSH_Protocol_to_2" do
  title "Set SSH Protocol to 2"
  desc  "SSH supports two different and incompatible protocols: SSH1 and SSH2. SSH1 was the original protocol and was subject to security issues. SSH2 is more advanced and secure."
  impact 1.0
  describe bash("grep '^\\s*Protocol\\s' /etc/ssh/sshd_config | head -1").stdout.to_s.[](/\s*\S+\s+(.+?)\s*(#.*)?$/, 1) do
    it { should eq "2" }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_9.3.2_Set_LogLevel_to_INFO" do
  title "Set LogLevel to INFO"
  desc  "The INFO parameter specifices that record login and logout activity will be logged."
  impact 1.0
  describe bash("grep '^\\s*LogLevel\\s' /etc/ssh/sshd_config | head -1").stdout.to_s.[](/\s*\S+\s+(.+?)\s*(#.*)?$/, 1) do
    it { should eq "INFO" }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_9.3.3_Set_Permissions_on_etcsshsshd_config" do
  title "Set Permissions on /etc/ssh/sshd_config"
  desc  "The /etc/ssh/sshd_config file contains configuration specifications for sshd. The command below sets the owner and group of the file to root."
  impact 1.0
  describe bash("stat -L -c \"%a %u %g\" /etc/ssh/sshd_config") do
    its("stdout") { should match /.00 0 0/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_9.3.4_Disable_SSH_X11_Forwarding" do
  title "Disable SSH X11 Forwarding"
  desc  "The X11Forwarding parameter provides the ability to tunnel X11 traffic through the connection to enable remote graphic connections."
  impact 1.0
  describe bash("grep '^\\s*X11Forwarding\\s' /etc/ssh/sshd_config | head -1").stdout.to_s.[](/\s*\S+\s+(.+?)\s*(#.*)?$/, 1) do
    it { should eq "no" }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_9.3.5_Set_SSH_MaxAuthTries_to_4_or_Less" do
  title "Set SSH MaxAuthTries to 4 or Less"
  desc  "The MaxAuthTries parameter specifies the maximum number of authentication attempts permitted per connection. When the login failure count reaches half the number, error messages will be written to the syslog file detailing the login failure."
  impact 1.0
  describe bash("grep '^\\s*MaxAuthTries\\s' /etc/ssh/sshd_config | head -1").stdout.to_s.[](/\s*\S+\s+(.+?)\s*(#.*)?$/, 1) do
    it { should cmp <= 4 }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_9.3.6_Set_SSH_IgnoreRhosts_to_Yes" do
  title "Set SSH IgnoreRhosts to Yes"
  desc  "The IgnoreRhosts parameter specifies that .rhosts and .shosts files will not be used in RhostsRSAAuthentication or HostbasedAuthentication."
  impact 1.0
  describe bash("grep '^\\s*IgnoreRhosts\\s' /etc/ssh/sshd_config | head -1").stdout.to_s.[](/\s*\S+\s+(.+?)\s*(#.*)?$/, 1) do
    it { should eq "yes" }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_9.3.7_Set_SSH_HostbasedAuthentication_to_No" do
  title "Set SSH HostbasedAuthentication to No"
  desc  "The HostbasedAuthentication parameter specifies if authentication is allowed through trusted hosts via the user of .rhosts, or /etc/hosts.equiv, along with successful public key client host authentication. This option only applies to SSH Protocol Version 2."
  impact 1.0
  describe bash("grep '^\\s*HostbasedAuthentication\\s' /etc/ssh/sshd_config | head -1").stdout.to_s.[](/\s*\S+\s+(.+?)\s*(#.*)?$/, 1) do
    it { should eq "no" }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_9.3.8_Disable_SSH_Root_Login" do
  title "Disable SSH Root Login"
  desc  "The PermitRootLogin parameter specifies if the root user can log in using ssh(1). The default is no."
  impact 1.0
  describe bash("grep '^\\s*PermitRootLogin\\s' /etc/ssh/sshd_config | head -1").stdout.to_s.[](/\s*\S+\s+(.+?)\s*(#.*)?$/, 1) do
    it { should eq "no" }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_9.3.9_Set_SSH_PermitEmptyPasswords_to_No" do
  title "Set SSH PermitEmptyPasswords to No"
  desc  "The PermitEmptyPasswords parameter specifies if the server allows login to accounts with empty password strings."
  impact 1.0
  describe bash("grep '^\\s*PermitEmptyPasswords\\s' /etc/ssh/sshd_config | head -1").stdout.to_s.[](/\s*\S+\s+(.+?)\s*(#.*)?$/, 1) do
    it { should eq "no" }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_9.3.10_Do_Not_Allow_Users_to_Set_Environment_Options" do
  title "Do Not Allow Users to Set Environment Options"
  desc  "The PermitUserEnvironment option allows users to present environment options to the ssh daemon."
  impact 1.0
  describe bash("grep '^\\s*PermitUserEnvironment\\s' /etc/ssh/sshd_config | head -1").stdout.to_s.[](/\s*\S+\s+(.+?)\s*(#.*)?$/, 1) do
    it { should eq "no" }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_9.3.11_Use_Only_Approved_Cipher_in_Counter_Mode" do
  title "Use Only Approved Cipher in Counter Mode"
  desc  "This variable limits the types of ciphers that SSH can use during communication."
  impact 1.0
  describe bash("grep '^\\s*Ciphers\\s' /etc/ssh/sshd_config | head -1").stdout.to_s.[](/\s*\S+\s+(.+?)\s*(#.*)?$/, 1) do
    it { should eq "aes128-ctr,aes192-ctr,aes256-ctr" }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_9.3.12_Set_Idle_Timeout_Interval_for_User_Login" do
  title "Set Idle Timeout Interval for User Login"
  desc  "The two options ClientAliveInterval and ClientAliveCountMax control the timeout of ssh sessions. When the ClientAliveInterval variable is set, ssh sessions that have no activity for the specified length of time are terminated. When the ClientAliveCountMax variable is set, sshd will send client alive messages at every ClientAliveInterval interval. When the number of consecutive client alive messages are sent with no response from the client, the ssh session is terminated. For example, if the ClientAliveInterval is set to 15 seconds and the ClientAliveCountMax is set to 3, the client ssh session will be terminated after 45 seconds of idle time."
  impact 1.0
  describe bash("grep '^\\s*ClientAliveInterval\\s' /etc/ssh/sshd_config | head -1").stdout.to_s.[](/\s*\S+\s+(.+?)\s*(#.*)?$/, 1) do
    it { should eq "300" }
  end
  describe bash("grep '^\\s*ClientAliveCountMax\\s' /etc/ssh/sshd_config | head -1").stdout.to_s.[](/\s*\S+\s+(.+?)\s*(#.*)?$/, 1) do
    it { should eq "0" }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_9.3.13_Limit_Access_via_SSH" do
  title "Limit Access via SSH"
  desc  "There are several options available to limit which users and group can access the system via SSH. It is recommended that at least one of the following options be leveraged:\n                    \n                         AllowUsers\n                        \n                     The AllowUsers variable gives the system administrator the option of allowing specific users to ssh into the system. The list consists of comma separated user names. Numeric userIDs are not recognized with this variable. If a system administrator wants to restrict user access further by only allowing the allowed users to log in from a particular host, the entry can be specified in the form of user@host.\n                    \n                         AllowGroups\n                        \n                     The AllowGroups variable gives the system administrator the option of allowing specific groups of users to ssh into the system. The list consists of comma separated user names. Numeric groupIDs are not recognized with this variable.\n                    \n                         DenyUsers\n                        \n                     The DenyUsers variable gives the system administrator the option of denying specific users to ssh into the system. The list consists of comma separated user names. Numeric userIDs are not recognized with this variable. If a system administrator wants to restrict user access further by specifically denying a user's access from a particular host, the entry can be specified in the form of user@host.\n                    \n                         DenyGroups\n                        \n                     The DenyGroups variable gives the system administrator the option of denying specific groups of users to ssh into the system. The list consists of comma separated group names. Numeric groupIDs are not recognized with this variable."
  impact 1.0
  describe file("/etc/ssh/sshd_config") do
    its("content") { should match /^\s*(AllowUsers|AllowGroups|DenyUsers|DenyGroups)\s+.*/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_9.3.14_Set_SSH_Banner" do
  title "Set SSH Banner"
  desc  "The Banner parameter specifies a file whose contents must be sent to the remote user before authentication is permitted. By default, no banner is displayed."
  impact 1.0
  describe bash("grep '^\\s*Banner\\s' /etc/ssh/sshd_config | head -1").stdout.to_s.[](/\s*\S+\s+(.+?)\s*(#.*)?$/, 1) do
    it { should match /issue(\.net)?/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_9.4_Restrict_root_Login_to_System_Console" do
  title "Restrict root Login to System Console"
  desc  "The file /etc/securetty contains a list of valid terminals that may be logged in directly as root."
  impact 0.0
end

control "xccdf_org.cisecurity.benchmarks_rule_9.5_Restrict_Access_to_the_su_Command" do
  title "Restrict Access to the su Command"
  desc  "The su command allows a user to run a command or shell as another user. The program has been superseded by sudo, which allows for more granular control over privileged access. Normally, the su command can be executed by any user. By uncommenting the pam_wheel.so statement in /etc/pam.d/su, the su command will only allow users in the wheel group to execute su."
  impact 1.0
  describe file("/etc/pam.d/su") do
    its("content") { should match /^\s*auth\s+required\s+pam_wheel.so\s+use_uid/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_10.1.1_Set_Password_Expiration_Days" do
  title "Set Password Expiration Days"
  desc  "The PASS_MAX_DAYS parameter in /etc/login.defs allows an administrator to force passwords to expire once they reach a defined age. It is recommended that the PASS_MAX_DAYS parameter be set to less than or equal to 90 days."
  impact 1.0
  describe file("/etc/login.defs") do
    its("content") { should match /^\s*PASS_MAX_DAYS\s+90/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_10.1.2_Set_Password_Change_Minimum_Number_of_Days" do
  title "Set Password Change Minimum Number of Days"
  desc  "The PASS_MIN_DAYS parameter in /etc/login.defs allows an administrator to prevent users from changing their password until a minimum number of days have passed since the last time the user changed their password. It is recommended that PASS_MIN_DAYS parameter be set to 7 or more days."
  impact 1.0
  describe file("/etc/login.defs") do
    its("content") { should match /^\s*PASS_MIN_DAYS\s+([7-9]|[1-9][0-9]*)/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_10.1.3_Set_Password_Expiring_Warning_Days" do
  title "Set Password Expiring Warning Days"
  desc  "The PASS_WARN_AGE parameter in /etc/login.defs allows an administrator to notify users that their password will expire in a defined number of days. It is recommended that the PASS_WARN_AGE parameter be set to 7 or more days."
  impact 1.0
  describe file("/etc/login.defs") do
    its("content") { should match /^\s*PASS_WARN_AGE\s+([7-9]|[1-9][0-9]+)/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_10.2_Disable_System_Accounts" do
  title "Disable System Accounts"
  desc  "There are a number of accounts provided with Ubuntu that are used to manage applications and are not intended to provide an interactive shell."
  impact 1.0
  describe bash("egrep -v \"^\\+\" /etc/passwd | awk -F: '($1!=\"root\" && $1!=\"sync\" && $1!=\"shutdown\" && $1!=\"halt\" && $3<500 && $7!=\"/usr/sbin/nologin\" && $7!=\"/bin/false\") {print}'") do
    its("stdout") { should_not match /.+/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_10.3_Set_Default_Group_for_root_Account" do
  title "Set Default Group for root Account"
  desc  "The usermod command can be used to specify which group the root user belongs to. This affects permissions of files that are created by the root user."
  impact 1.0
  describe bash("grep \"^root:\" /etc/passwd | cut -f4 -d:") do
    its("stdout") { should match /^0$/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_10.4_Set_Default_umask_for_Users" do
  title "Set Default umask for Users"
  desc  "The default umask determines the permissions of files created by users. The user creating the file has the discretion of making their files and directories readable by others via the chmod command. Users who wish to allow their files and directories to be readable by others by default may choose a different default umask by inserting the umask command into the standard shell configuration files (.profile, .bashrc, etc.) in their home directories."
  impact 1.0
  describe file("/etc/login.defs") do
    its("content") { should match /^UMASK\s+077$/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_10.5_Lock_Inactive_User_Accounts" do
  title "Lock Inactive User Accounts"
  desc  "User accounts that have been inactive for over a given period of time can be automatically disabled. It is recommended that accounts that are inactive for 35 or more days be disabled."
  impact 1.0
  describe bash("useradd -D | grep INACTIVE") do
    its("stdout") { should match /^INACTIVE=35$/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_11.1_Set_Warning_Banner_for_Standard_Login_Services" do
  title "Set Warning Banner for Standard Login Services"
  desc  "The contents of the /etc/issue file are displayed prior to the login prompt on the system's console and serial devices, and also prior to logins via telnet. The contents of the /etc/motd file is generally displayed after all successful logins, no matter where the user is logging in from, but is thought to be less useful because it only provides notification to the user after the machine has been accessed."
  impact 1.0
  describe bash("ui=($(echo 0022 -n | fold -w1));sys=($(stat -L --format=\"%a\" /etc/motd | awk '{printf \"%04d\\n\", $0;}' | fold -w1));for (( i=0; i<4; i++ )); do echo -n $(( ${ui[$i]} & ${sys[$i]})); done;").stdout.to_s.[](/^(\d+)$/, 1) do
    it { should eq "0000" }
  end
  describe bash("ui=($(echo 0022 -n | fold -w1));sys=($(stat -L --format=\"%a\" /etc/issue | awk '{printf \"%04d\\n\", $0;}' | fold -w1));for (( i=0; i<4; i++ )); do echo -n $(( ${ui[$i]} & ${sys[$i]})); done;").stdout.to_s.[](/^(\d+)$/, 1) do
    it { should eq "0000" }
  end
  describe bash("ui=($(echo 0022 -n | fold -w1));sys=($(stat -L --format=\"%a\" /etc/issue.net | awk '{printf \"%04d\\n\", $0;}' | fold -w1));for (( i=0; i<4; i++ )); do echo -n $(( ${ui[$i]} & ${sys[$i]})); done;").stdout.to_s.[](/^(\d+)$/, 1) do
    it { should eq "0000" }
  end
  describe file("/etc/issue") do
    its("content") { should match /.+/ }
  end
  describe file("/etc/issue.net") do
    its("content") { should match /.+/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_11.2_Remove_OS_Information_from_Login_Warning_Banners" do
  title "Remove OS Information from Login Warning Banners"
  desc  "Unix-based systems have typically displayed information about the OS release and patch level upon logging in to the system. This information can be useful to developers who are developing software for a particular OS platform. If mingetty(8) supports the following options, they display operating system information:  \\m - machine architecture (uname -m) \\r - operating system release (uname -r) \\s - operating system name \\v - operating system version (uname -v)"
  impact 1.0
  describe file("/etc/motd") do
    its("content") { should_not match /(\\v|\\r|\\m|\\s)/ }
  end
  describe file("/etc/issue") do
    its("content") { should_not match /(\\v|\\r|\\m|\\s)/ }
  end
  describe file("/etc/issue.net") do
    its("content") { should_not match /(\\v|\\r|\\m|\\s)/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_11.3_Set_Graphical_Warning_Banner" do
  title "Set Graphical Warning Banner"
  desc  "Ubuntu defaults to using lightdm for graphical login session management which provides no built in banner setting. The GNOME Display Manager and KDM are both available but must be manually installed."
  impact 0.0
end

control "xccdf_org.cisecurity.benchmarks_rule_12.1_Verify_Permissions_on_etcpasswd" do
  title "Verify Permissions on /etc/passwd"
  desc  "The /etc/passwd file contains user account information that is used by many system utilities and therefore must be readable for these utilities to operate."
  impact 1.0
  describe bash("ui=($(echo 0022 -n | fold -w1));sys=($(stat -L --format=\"%a\" /etc/passwd | awk '{printf \"%04d\\n\", $0;}' | fold -w1));for (( i=0; i<4; i++ )); do echo -n $(( ${ui[$i]} & ${sys[$i]})); done;").stdout.to_s.[](/^(\d+)$/, 1) do
    it { should eq "0000" }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_12.2_Verify_Permissions_on_etcshadow" do
  title "Verify Permissions on /etc/shadow"
  desc  "The /etc/shadow file is used to store the information about user accounts that is critical to the security of those accounts, such as the hashed password and other security information."
  impact 1.0
  describe bash("ui=($(echo 0037 -n | fold -w1));sys=($(stat -L --format=\"%a\" /etc/shadow | awk '{printf \"%04d\\n\", $0;}' | fold -w1));for (( i=0; i<4; i++ )); do echo -n $(( ${ui[$i]} & ${sys[$i]})); done;").stdout.to_s.[](/^(\d+)$/, 1) do
    it { should eq "0000" }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_12.3_Verify_Permissions_on_etcgroup" do
  title "Verify Permissions on /etc/group"
  desc  "The /etc/group file contains a list of all the valid groups defined in the system. The command below allows read/write access for root and read access for everyone else."
  impact 1.0
  describe bash("ui=($(echo 0022 -n | fold -w1));sys=($(stat -L --format=\"%a\" /etc/group | awk '{printf \"%04d\\n\", $0;}' | fold -w1));for (( i=0; i<4; i++ )); do echo -n $(( ${ui[$i]} & ${sys[$i]})); done;").stdout.to_s.[](/^(\d+)$/, 1) do
    it { should eq "0000" }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_12.4_Verify_UserGroup_Ownership_on_etcpasswd" do
  title "Verify User/Group Ownership on /etc/passwd"
  desc  "The /etc/passwd file contains a list of all the valid userIDs defined in the system, but not the passwords. The command below sets the owner and group of the file to root."
  impact 1.0
  describe bash("stat -c \"%u %g\" /etc/passwd") do
    its("stdout") { should match /0 0/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_12.5_Verify_UserGroup_Ownership_on_etcshadow" do
  title "Verify User/Group Ownership on /etc/shadow"
  desc  "The /etc/shadow file contains the one-way cipher text passwords for each user defined in the /etc/passwd file. The command below sets the user and group ownership of the file to root."
  impact 1.0
  describe bash("stat -c \"%u %g\" /etc/shadow") do
    its("stdout") { should match /0 (0|42)/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_12.6_Verify_UserGroup_Ownership_on_etcgroup" do
  title "Verify User/Group Ownership on /etc/group"
  desc  "The /etc/group file contains a list of all the valid groups defined in the system. The command below allows read/write access for root and read access for everyone else."
  impact 1.0
  describe bash("stat -c \"%u %g\" /etc/group") do
    its("stdout") { should match /0 0/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_12.7_Find_World_Writable_Files" do
  title "Find World Writable Files"
  desc  "Unix-based systems support variable settings to control access to files. World writable files are the least secure. See the chmod(2) man page for more information."
  impact 0.0
  describe bash("df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -type f -perm -0002 -print") do
    its("stdout") { should_not match /.+/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_12.8_Find_Un-owned_Files_and_Directories" do
  title "Find Un-owned Files and Directories"
  desc  "Sometimes when administrators delete users from the password file they neglect to remove all files owned by those users from the system."
  impact 1.0
  describe bash("df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -nouser -ls") do
    its("stdout") { should_not match /.+/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_12.9_Find_Un-grouped_Files_and_Directories" do
  title "Find Un-grouped Files and Directories"
  desc  "Sometimes when administrators delete users from the password file they neglect to remove all files owned by those users from the system."
  impact 1.0
  describe bash("df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -nogroup -ls") do
    its("stdout") { should_not match /.+/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_12.10_Find_SUID_System_Executables" do
  title "Find SUID System Executables"
  desc  "The owner of a file can set the file's permissions to run with the owner's or group's permissions, even if the user running the program is not the owner or a member of the group. The most common reason for a SUID program is to enable users to perform functions (such as changing their password) that require root privileges."
  impact 0.0
end

control "xccdf_org.cisecurity.benchmarks_rule_12.11_Find_SGID_System_Executables" do
  title "Find SGID System Executables"
  desc  "The owner of a file can set the file's permissions to run with the owner's or group's permissions, even if the user running the program is not the owner or a member of the group. The most common reason for a SGID program is to enable users to perform functions (such as changing their password) that require root privileges."
  impact 0.0
end

control "xccdf_org.cisecurity.benchmarks_rule_13.1_Ensure_Password_Fields_are_Not_Empty" do
  title "Ensure Password Fields are Not Empty"
  desc  "An account with an empty password field means that anybody may log in as that user without providing a password."
  impact 1.0
  describe bash("cat /etc/shadow | awk -F: '($2 == \"\" ) { print $1 \" does not have a password \"}'") do
    its("stdout") { should_not match /.+/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_13.2_Verify_No_Legacy__Entries_Exist_in_etcpasswd_File" do
  title "Verify No Legacy \"+\" Entries Exist in /etc/passwd File"
  desc  "The character + in various files used to be markers for systems to insert data from NIS maps at a certain point in a system configuration file. These entries are no longer required on most systems, but may exist in files that have been imported from other platforms."
  impact 1.0
  describe file("/etc/passwd") do
    its("content") { should_not match /^\+/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_13.3_Verify_No_Legacy__Entries_Exist_in_etcshadow_File" do
  title "Verify No Legacy \"+\" Entries Exist in /etc/shadow File"
  desc  "The character + in various files used to be markers for systems to insert data from NIS maps at a certain point in a system configuration file. These entries are no longer required on most systems, but may exist in files that have been imported from other platforms."
  impact 1.0
  describe file("/etc/shadow") do
    its("content") { should_not match /^\+/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_13.4_Verify_No_Legacy__Entries_Exist_in_etcgroup_File" do
  title "Verify No Legacy \"+\" Entries Exist in /etc/group File"
  desc  "The character + in various files used to be markers for systems to insert data from NIS maps at a certain point in a system configuration file. These entries are no longer required on most systems, but may exist in files that have been imported from other platforms."
  impact 1.0
  describe file("/etc/group") do
    its("content") { should_not match /^\+/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_13.5_Verify_No_UID_0_Accounts_Exist_Other_Than_root" do
  title "Verify No UID 0 Accounts Exist Other Than root"
  desc  "Any account with UID 0 has superuser privileges on the system."
  impact 1.0
  describe bash("/bin/cat /etc/passwd | /bin/awk -F: '($3 == 0) { print $1 }' | grep -v 'root'") do
    its("stdout") { should_not match /.+/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_13.6_Ensure_root_PATH_Integrity" do
  title "Ensure root PATH Integrity"
  desc  "The root user can execute any command on the system and could be fooled into executing programs unintentionally if the PATH is not set correctly."
  impact 1.0
  describe bash("echo $PATH") do
    its("stdout") { should_not match /(^|:):/ }
  end
  describe bash("echo $PATH") do
    its("stdout") { should_not match /:$/ }
  end
  describe bash("echo $PATH") do
    its("stdout") { should_not match /(^|:|\/)\.+($|:|\/)/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_13.7_Check_Permissions_on_User_Home_Directories" do
  title "Check Permissions on User Home Directories"
  desc  "While the system administrator can establish secure permissions for users' home directories, the users can easily override these."
  impact 1.0
  describe bash("for i in $(awk -F: '($7 != \"/usr/sbin/nologin\" && $3 >= 500) {print $6}' /etc/passwd | sort -u); do echo $i $(stat -L --format=%a $i) | grep -v ' .[0145][0145]$';done") do
    its("stdout") { should_not match /.+/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_13.8_Check_User_Dot_File_Permissions" do
  title "Check User Dot File Permissions"
  desc  "While the system administrator can establish secure permissions for users' \"dot\" files, the users can easily override these."
  impact 1.0
  describe bash("find `cat /etc/passwd | egrep -v \"root|sync|halt|shutdown\" | awk -F: '($7 != \"/usr/sbin/nologin\" && $7) {print $6}' | sort | uniq | grep -v \"^/$\"` -name \".*\" -perm /go+w -follow") do
    its("stdout") { should_not match /.+/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_13.9_Check_Permissions_on_User_.netrc_Files" do
  title "Check Permissions on User .netrc Files"
  desc  "While the system administrator can establish secure permissions for users' .netrc files, the users can easily override these."
  impact 1.0
  describe bash("find `cat /etc/passwd | egrep -v \"root|sync|halt|shutdown\" | awk -F: '($7 != \"/usr/sbin/nologin\" && $7) {print $6}' | sort | uniq | grep -v \"^/$\"` -name \".netrc\" -perm /go+w") do
    its("stdout") { should_not match /.+/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_13.10_Check_for_Presence_of_User_.rhosts_Files" do
  title "Check for Presence of User .rhosts Files"
  desc  "While no .rhosts files are shipped by default, users can easily create them."
  impact 1.0
  describe bash("cut -f6 -d: /etc/passwd | sort -u | while read DIR; do ls $DIR/.rhosts 2>/dev/null; done") do
    its("stdout") { should_not match /.+/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_13.11_Check_Groups_in_etcpasswd" do
  title "Check Groups in /etc/passwd"
  desc  "Over time, system administration errors and changes can lead to groups being defined in /etc/passwd but not in /etc/group."
  impact 1.0
  describe bash("for i in $(cut -s -d: -f4 /etc/passwd | sort -u ); do grep -q -P \"^.*?:[^:]*:$i:\" /etc/group; if [ $? -ne 0 ]; then echo \"Group $i is referenced by /etc/passwd but does not exist in /etc/group\"; fi; done") do
    its("stdout") { should_not match /.+/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_13.12_Check_That_Users_Are_Assigned_Valid_Home_Directories" do
  title "Check That Users Are Assigned Valid Home Directories"
  desc  "Users can be defined in /etc/passwd without a home directory or with a home directory that does not actually exist."
  impact 1.0
  describe bash(" cat /etc/passwd | awk -F: '{ print $1 \" \" $3 \" \" $6 }' | while read user uid dir; do if [ $uid -ge 500 -a ! -d \"$dir\" -a $user != \"nfsnobody\" -a $user != \"nobody\" ]; then echo \"The home directory ($dir) of user $user does not exist.\"; fi; done") do
    its("stdout") { should_not match /.+/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_13.13_Check_User_Home_Directory_Ownership" do
  title "Check User Home Directory Ownership"
  desc  "The user home directory is space defined for the particular user to set local environment variables and to store personal files."
  impact 1.0
  describe bash("cat /etc/passwd | awk -F: '{ print $1 \" \" $3 \" \" $6 }' | while read user uid dir; do if [ $uid -ge 500 -a -d \"$dir\" -a $user != \"nfsnobody\" -a $user != \"nobody\" ]; then owner=$(stat -L -c \"%U\" \"$dir\"); if [ \"$owner\" != \"$user\" ]; then echo \"The home directory ($dir) of user $user is owned by $owner.\"; fi; fi; done;") do
    its("stdout") { should_not match /.+/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_13.14_Check_for_Duplicate_UIDs" do
  title "Check for Duplicate UIDs"
  desc  "Although the useradd program will not let you create a duplicate User ID (UID), it is possible for an administrator to manually edit the /etc/passwd file and change the UID field."
  impact 1.0
  describe bash("egrep -v \"^\\+\" /etc/passwd | cut -f3 -d\":\" | sort -n | uniq -c | awk '{ if ($1 != 1) { print \"Duplicate UID found: \" $2 } }'") do
    its("stdout") { should_not match /.+/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_13.15_Check_for_Duplicate_GIDs" do
  title "Check for Duplicate GIDs"
  desc  "Although the groupadd program will not let you create a duplicate Group ID (GID), it is possible for an administrator to manually edit the /etc/group file and change the GID field."
  impact 1.0
  describe bash("egrep -v \"^\\+\" /etc/group | cut -f3 -d\":\" | sort -n | uniq -c | awk '{ if ($1 != 1) { print \"Duplicate GUID found: \" $2 } }'") do
    its("stdout") { should_not match /.+/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_13.16_Check_for_Duplicate_User_Names" do
  title "Check for Duplicate User Names"
  desc  "Although the useradd program will not let you create a duplicate user name, it is possible for an administrator to manually edit the /etc/passwd file and change the user name."
  impact 1.0
  describe bash("egrep -v \"^\\+\" /etc/passwd | cut -f1 -d\":\" | sort | uniq -c | awk '{ if ($1 != 1) { print \"Duplicate User name Found: \" $2 } }'") do
    its("stdout") { should_not match /.+/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_13.17_Check_for_Duplicate_Group_Names" do
  title "Check for Duplicate Group Names"
  desc  "Although the groupadd program will not let you create a duplicate group name, it is possible for an administrator to manually edit the /etc/group file and change the group name."
  impact 1.0
  describe bash("egrep -v \"^\\+\" /etc/group | cut -f1 -d\":\" | sort -n | uniq -c | awk '{ if ($1 != 1) { print \"Duplicate Group name Found: \" $2 } }'") do
    its("stdout") { should_not match /.+/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_13.18_Check_for_Presence_of_User_.netrc_Files" do
  title "Check for Presence of User .netrc Files"
  desc  "The .netrc file contains data for logging into a remote host for file transfers via FTP."
  impact 1.0
  describe bash("egrep -v \"^\\+\" /etc/passwd | cut -f6 -d: | sort -u | while read DIR; do ls $DIR/.netrc 2>/dev/null; done") do
    its("stdout") { should_not match /.+/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_13.19_Check_for_Presence_of_User_.forward_Files" do
  title "Check for Presence of User .forward Files"
  desc  "The .forward file specifies an email address to forward the user's mail to."
  impact 1.0
  describe bash("egrep -v \"^\\+\" /etc/passwd | cut -f6 -d: | sort -u | while read D; do ls $D/.forward 2&gt;/dev/null; done") do
    its("stdout") { should_not match /.+/ }
  end
end

control "xccdf_org.cisecurity.benchmarks_rule_13.20_Ensure_shadow_group_is_empty" do
  title "Ensure shadow group is empty"
  desc  "The shadow group allows system programs which require access the ability to read the /etc/shadow file. No users should be assigned to the shadow group."
  impact 1.0
  describe file("/etc/group") do
    its("content") { should_not match /^shadow:x:15:.+$/ }
  end
  describe bash("awk -F: '($4 == \"42\") { print }' /etc/passwd") do
    its("stdout") { should_not match /.+/ }
  end
end
