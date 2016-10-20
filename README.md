[![Build Status](https://circleci.com/gh/cloudify-examples/spark-standalone-blueprint.svg?style=shield&circle-token=:circle-token)](https://circleci.com/gh/cloudify-examples/spark-standalone-blueprint)

# Spark blueprint standalone-mode
 
Spark Blueprint Standalone Mode

It's main purpose is to deploy a standalone mode spark on Openstack.

so once you have a manager up and running and after you cloned this blueprint the next step is to upload the blueprint.

Step 1: Upload the blueprint

cfy blueprints upload -b <choose_blueprint_id> -p <blueprint_filename>

Step 2: Create a deployment

Every one of these blueprints have inputs, which can be populated for a deployment using input files.
Example input files are located inside the inputs directory.
Note that these files only contain the mandatory inputs, i.e, one's that the blueprint does not define a default value for.

After you filled the input file corresponding to your blueprint, run:

cfy deployments create -b <blueprint_id> -d <choose_deployment_id> -i inputs/<inputs_filename>

Step 4: Install
before you start the deployment run the prep.sh on the manager using: cfy ssh

Once the deployment is created, we can start running workflows:

cfy executions start -w install -d <deployment_id>

This process will create all the cloud resources needed for the application:

    VM's
    Floating IP's
    Security Groups

and everything else that is needed and declared in the blueprint.

Step 5: Once the workflow execution is complete, we can start it by running:
/usr/local/spark/bin/spark-shell
on the instance after ssh-ing to it.

Open a browser to see the application UI. 
http://instance-ip-address:4040

Step 6: Uninstalling

Now lets run the uninstall workflow. This will uninstall the application, as well as delete all related resources.

cfy executions start -w uninstall -d <deployment_id>

Step 7: Delete the deployment

Its best to delete deployments we are no longer using, since they take up memory on the management machine. We do this by running:

cfy deployments delete -d <deployment_id>



