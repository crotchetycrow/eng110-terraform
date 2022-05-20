# Terraform

## What is pull based configuration management?

In this type of configuration management tool, the nodes pull the configuration information from the server (hence, the name).

A small software (called agent or client) is installed on every node. This agent/client will:

- At regular intervals, get the configuration from the server
- Compare the configuration received from the server with the current configuration of the node
- If there is any mis-match, take the steps required to match the configuration of the node with the configuration received from the server.

This means that, its always the agent/client that initiates communication, not the main server.

Chef & Puppet are good examples of such configuration management tools.

## What is push based configuration management?

In this type of configuration management tool, the main server (where the configuration data is stored) pushes the configuration to the node (hence, the name). So, it is the main server that initiates communication, not the nodes. Which means that an agent/client may or may not be installed on each node.

Ansible is an example of a push based configuration management tool that doesn’t need an agent to be installed on the nodes. SaltStack is an example of a push based configuration management tool that needs an agent (minion) to be installed on the nodes. In both cases, its the main server that starts the communication and sends the configuration data to the nodes without the nodes asking for it.

## Commands

Main commands:
`init` - Prepare your working directory for other commands
`validate` - Check whether the configuration is valid
`plan` - Show changes required by the current configuration
`apply` - Create or update infrastructure
`destroy` - Destroy previously-created infrastructure

All other commands:
`console` - Try Terraform expressions at an interactive command prompt
`fmt` - Reformat your configuration in the standard style
`force-unlock` - Release a stuck lock on the current workspace
`get` - Install or upgrade remote Terraform modules
`graph` - Generate a Graphviz graph of the steps in an operation
`import` - Associate existing infrastructure with a Terraform resource
`login` - Obtain and save credentials for a remote host
`logout` - Remove locally-stored credentials for a remote host
`output` - Show output values from your root module
`providers` - Show the providers required for this configuration
`refresh` - Update the state to match remote systems
`show` - Show the current state or a saved plan
state - Advanced state management
`taint` - Mark a resource instance as not fully functional
`test` - Experimental support for module integration testing
`untaint` - Remove the 'tainted' state from a resource instance
`version` - Show the current Terraform version
`workspace` - Workspace management

`terraform import aws_vpc.default(or main) vpc-id` - import existing vpc

Packer by Hashicorp for building AMIs (https://www.packer.io/plugins/builders/amazon)
