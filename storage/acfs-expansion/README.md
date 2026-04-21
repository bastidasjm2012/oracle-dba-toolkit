# Oracle ACFS Online Filesystem Expansion (ASM) – Production Scenario

##  Overview

This document describes a real-world ACFS filesystem expansion performed online over Oracle ASM without downtime.

The scenario was executed in a production environment using Oracle Database 19c SE2 in an active-passive configuration.

---

##  Why this matters

In enterprise environments:

* Storage growth is inevitable
* Downtime is NOT acceptable

Oracle ACFS provides:

* Online filesystem expansion
* No unmount required
* Zero application impact
* Native integration with ASM

---

##  Architecture Context

* Oracle Database 19c SE2
* Active-Passive HA (non-RAC)
* ASM Diskgroup: DATA
* ACFS Mountpoint: `/ORABKP`

---

##  Procedure

###  Step 1 – Validate filesystem

```bash
acfsutil info fs /ORABKP
```

![Filesystem Validation](images/acfs_01_validate_fs.png)

**Figure 1 – Filesystem status validation**

---

###  Step 2 – Validate ASM volume

```bash
asmcmd volinfo -G DATA ORABKP
```

![ASM Volume](images/acfs_02_volinfo.png)

**Figure 2 – ASM volume details**

---

###  Step 3 – Validate diskgroup space

```bash
asmcmd lsdg DATA
```

![Diskgroup Space](images/acfs_03_lsdg.png)

**Figure 3 – Available space validation**

---

###  Step 4 – Perform online expansion

```bash
acfsutil size +200G /ORABKP
acfsutil size +200G /ORABKP
acfsutil size +200G /ORABKP
```

![Resize Execution](images/acfs_04_resize.png)

**Figure 4 – Incremental expansion execution**

---

###  Step 5 – Validate at OS level

```bash
df -h /ORABKP
```

![OS Validation](images/acfs_05_df.png)

**Figure 5 – Filesystem size validation**

---

###  Step 6 – Validate in ASM

```bash
asmcmd volinfo -G DATA ORABKP
```

![ASM Validation](images/acfs_06_post_volinfo.png)

**Figure 6 – Updated volume size**

---

###  Step 7 – Final diskgroup validation

```bash
asmcmd lsdg DATA
```

![Final DG](images/acfs_07_final_lsdg.png)

**Figure 7 – Diskgroup health validation**

---

##  Automation Script

See: `acfs_online_resize.sh`

---

##  SQL Validation

See: `acfs_validation.sql`

---

##  Final Validation

* Filesystem expanded successfully
* No downtime occurred
* No application impact
* ASM and OS validation completed

---

##  My Contribution

This contribution demonstrates a real production execution of ACFS filesystem expansion over ASM.

It includes:

* Pre-validation of filesystem and diskgroup
* Controlled incremental expansion strategy
* Online execution without service interruption
* Post-validation at OS and ASM levels

This reflects real-world DBA operational practices in critical environments.

---

##  Key Learnings

* ACFS supports fully online filesystem expansion
* Incremental resizing reduces operational risk
* Diskgroup validation is mandatory before resizing
* ASM + ACFS integration simplifies storage management

---

##  Conclusion

Oracle ASM and ACFS together provide a robust enterprise storage solution enabling safe, scalable, and zero-downtime operations.

---

##  Author

Jesus Bastidas
Oracle DBA | OCI Certified | ACE Apprentice
