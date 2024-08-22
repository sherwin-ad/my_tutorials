### Connect using google cli (gcloud)

Acquire the user credentials to use for Application Default Credentials (ADC) using the following command:

```
# gcloud auth application-default login
Your browser has been opened to visit:

    https://accounts.google.com/o/oauth2/auth?response_type=code&client_id=764086051850-6qr4p6gpi6hn506pt8ejuq83di341hur.apps.googleusercontent.com&redirect_uri=http%3A%2F%2Flocalhost%3A8085%2F&scope=openid+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.email+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fcloud-platform+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fsqlservice.login&state=xzMYPIivPX5duEpzg40RIBqXca5bmG&access_type=offline&code_challenge=wgrp-2157nWPnJR-JFOajp0cdxz6FtbRtjIbDyUNHfc&code_challenge_method=S256


Credentials saved to file: [/Users/sherwinowen/.config/gcloud/application_default_credentials.json]

These credentials will be used by any library that requests Application Default Credentials (ADC).

Quota project "ccc-moodle-lms" was added to ADC which can be used by Google client libraries for billing and quota. Note that some services may still bill the project owning the resource.
```

### Running Terraform using Service Accounts



### Terraform input variable types

Input variables **support multiple data types**.

They are broadly categorized as simple and complex. `String`, `number`, `bool` are simple data types, whereas `list`, `map`, `tuple`, `object`, and `set` are complex data types.

The following snippets provide examples for each of the types we listed.

#### String type

The string type input variables are used to accept values in the form of UNICODE characters. The value is usually wrapped by double quotes, as shown below.

```hcl
variable "string_type" {
 description = "This is a variable of type string"
 type        = string
 default     = "Default string value for this variable"
}
```

The string type input variables also support a heredoc style format where the value being accepted is a longer string separated by new line characters. The start and end of the value is indicated by “EOF” (End Of File) characters. An example of the same is shown below.

```hcl
variable "string_heredoc_type" {
 description = "This is a variable of type string"
 type        = string
 default     = <<EOF
hello, this is Sumeet.
Do visit my website!
EOF
}
```

#### Number type

The number type input variable enables us to define and accept numerical values as inputs for their infrastructure deployments. For example, these numeric values can help define the desired number of instances to be created in an auto-scaling group. The code below defines a number type input variable in any given Terraform config.

```hcl
variable "number_type" {
 description = "This is a variable of type number"
 type        = number
 default     = 42
}
```

#### Boolean type

The boolean type input variable is used to define and accept true/false values as inputs for infrastructure deployments to incorporate logic and conditional statements into the Terraform configurations. Boolean input variables are particularly useful for enabling or disabling certain features or behaviors in infrastructure deployments.

An example of a boolean variable is below.

```hcl
variable "boolean_type" {
 description = "This is a variable of type bool"
 type        = bool
 default     = true
}
```

#### Terraform list variable

Terraform list variables allow us to define and accept a collection of values as inputs for infrastructure deployments. A list is an ordered sequence of elements, and it can contain any data type, such as strings, numbers, or even other complex data structures. However, a single list cannot have multiple data types.

List type input variables are particularly useful in scenarios where we need to provide multiple values of the same type, such as a list of IP addresses, a set of ports, or a collection of resource names.

The example below is for an input variable of a type list that contains strings.

```hcl
variable "list_type" {
 description = "This is a variable of type list"
 type        = list(string)
 default     = ["string1", "string2", "string3"]
}
```

#### Map type

The map type input variable enables us to define and accept a collection of key-value pairs as inputs for our infrastructure deployments. A map is a complex data structure that associates values with unique keys, similar to a dictionary or an object in other programming languages. For example, a map can be used to specify resource tags, environment-specific settings, or configuration parameters for different modules.

The example below shows how a map of string type values is defined in Terraform.

```hcl
variable "map_type" {
 description = "This is a variable of type map"
 type        = map(string)
 default     = {
   key1 = "value1"
   key2 = "value2"
 }
}
```

#### Object type

An object represents a complex data structure that consists of multiple key-value pairs, where each key is associated with a specific data type for its corresponding value. The object type input variable allows us to define and accept a structured set of properties or attributes as inputs for our infrastructure deployments. For example, an object is used to define a set of parameters for a server configuration.

The variable below demonstrates how an object type input variable is defined with multi-typed properties.

```hcl
variable "object_type" {
 description = "This is a variable of type object"
 type        = object({
   name    = string
   age     = number
   enabled = bool
 })
 default = {
   name    = "John Doe"
   age     = 30
   enabled = true
 }
}
```

#### Tuple type

A tuple is a fixed-length collection that can contain values of different data types. The key differences between tuples and lists are:

1. Tuples have a fixed length, as against lists.
2. With tuples, it is possible to include values with different primitive types. Meanwhile, lists dictate the type of elements included in them.
3. Values included in tuples are ordered. Due to their dynamic sizes, it is possible to resize and reorder the values in lists.

An example of a tuple type input variable:

```hcl
variable "tuple_type" {
 description = "This is a variable of type tuple"
 type        = tuple([string, number, bool])
 default     = ["item1", 42, true]
}
```

#### Set type

A set is an unordered collection of distinct values, meaning each element appears only once within the set. As against lists, sets enforce uniqueness – each element can appear only once within the set. Sets support various inbuilt operations such as union, intersection, and difference, which are used to combine or compare sets.

An example of a set type input variable is below.

```hcl
variable "set_example" {
 description = "This is a variable of type set"
 type        = set(string)
 default     = ["item1", "item2", "item3"]
}
```

#### Map of objects

One of the widely used complex input variable types is map(object). It is a data type that represents a map where each key is associated with an object value.

It allows us to create a collection of key-value pairs, where the values are objects with defined attributes and their respective values. When using map(object), we define the structure of the object values by specifying the attributes and their corresponding types within the object type definition. Each object within the map can have its own set of attributes, providing flexibility to represent diverse sets of data.

An example of the same is given below, where the map of objects represents attribute values used for the creation of multiple subnets.

```hcl
variable "map_of_objects" {
  description = "This is a variable of type Map of objects"
  type = map(object({
    name = string,
    cidr = string
  }))
  default = {
    "subnet_a" = {
    name = "Subnet A",
    cidr = "10.10.1.0/24"
    },
  "subnet_b" = {
    name = "Subnet B",
    cidr = "10.10.2.0/24"
    },
  "subnet_c" = {
    name = "Subnet C",
    cidr = "10.10.3.0/24"
    }
  }
}
```

#### List of objects

This type of variable is similar to the Map of objects, except that the objects are not referred to by any “key”. The example used for the Map of objects can also be represented in the form of a list of objects, as shown below.

The list(object) is an ordered list of objects where each object is referred to using the index. On the other hand, map(object) is an unordered set, and each object is referred to using the key value.

```hcl
variable "list_of_objects" {
  description = "This is a variable of type List of objects"
  type = list(object({
    name = string,
    cidr = string
  }))
  default = [
    {
      name = "Subnet A",
      cidr = "10.10.1.0/24"
    },
    {
      name = "Subnet B",
      cidr = "10.10.2.0/24"
    },
    {
      name = "Subnet C",
      cidr = "10.10.3.0/24"
    }
  ]
}
```
