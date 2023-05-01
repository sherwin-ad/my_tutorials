# Google Certified Professional Security Engineer

# Organization Policies

## Disable service account creation

Goto > IAM & Admin > Organization Poilicies > Disable service account creation

![image-20230424201708478](images/image-20230424201708478.png)

## Enforce uniform bucket-level access

Goto > IAM & Admin > Organization Poilicies > Enforce uniform bucket-level access

![image-20230424202611082](images/image-20230424202611082.png)

## Skip default network creation

Goto > IAM & Admin > Organization Poilicies > Skip default network creation

![image-20230424203737141](images/image-20230424203737141.png)



# Cloud IAM

## Primitive Roles

- Too much Broad access
- Not recommended
- Does not follow principal of least privilege 
- Reader=Read only permission for all resource inside project
- Editor= Reader + Modification
- Owner= editor + manage user, groups, billing



Goto IAM & Admin > Roles

- Filter: Used in Project

![image-20230424210413970](images/image-20230424210413970.png)

## Pre-Defined Roles

- GCP defined Role
- Maintained by GCP
- For each product/services –Different sets of Roles defined
- Like : 
  - Compute Admin
  - Network viewer
  - Big query Job user



# Service Accounts

**Lists credential accounts.**

```
$ gcloud auth list
                  Credentialed Accounts
ACTIVE  ACCOUNT
*       102439239747-compute@developer.gserviceaccount.com

To set the active account, run:
    $ gcloud config set account `ACCOUNT`
```

**Impersonate service account to user**

```
$ gcloud compute instances list --project [project_name] --impersonate-service-account [service_account_name]
```

**Service Accout RSA private keys**

1. Create service account 
2. Give roles to the service account
3. Create new key

```
$ gcloud config unset project
```

Activate service account using keys created

```
$ gcloud auth activate-service-account --key-file=gcp-devops-379408-8a0d9c5f201c.json
Activated service account credentials for: [sa-demo@gcp-devops-379408.iam.gserviceaccount.com]

$ gcloud auth list
                  Credentialed Accounts
ACTIVE  ACCOUNT
*       sa-demo@gcp-devops-379408.iam.gserviceaccount.com
        sherwin@mybusybee.net

To set the active account, run:
    $ gcloud config set account `ACCOUNT`
```

```
$ gcloud compute instances list --project gcp-devops
```

