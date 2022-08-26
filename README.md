Quick & dirty container for the `sysdig-cli-scanner`

A few notes:
* It requires alpine instead of scratch because it doesn't include chmod (of course). 
* The sysdig-cli-scanner version number is used also for the container tab

# Build

It requires you to be logged in your container image repository (`docker login`)
and modify the REPO variable in the `doit.sh` script.

Then is just a matter of running the `doit.sh` script.

# Run it

```
docker run -it --rm -e SECURE_API_TOKEN="XXXX" quay.io/e_minguez/sysdig-cli-scanner:1.2.6 sysdiglabs/dummy-vuln-app  --apiurl https://eu1.app.sysdig.com
```

