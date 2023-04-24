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



Goto IAM & Admin > Roles

