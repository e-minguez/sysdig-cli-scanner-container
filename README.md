Quick & dirty container for the `sysdig-cli-scanner`

A few notes:
* It does a multistep build to get the certificates and the binary from an alpine container, then it uses the debian distroless to save some disk space (the binary itself is 28MB and the image is 31MB)
* The sysdig-cli-scanner version number is used also for the container label

# Build

It requires you to be logged in your container image repository (`docker login`)
and modify the REPO variable in the `doit.sh` script.

Then is just a matter of running the `doit.sh` script.

# Run it

```
docker run -it --rm -e SECURE_API_TOKEN="XXXX" quay.io/e_minguez/sysdig-cli-scanner:1.2.6 sysdiglabs/dummy-vuln-app  --apiurl https://eu1.app.sysdig.com

2022-08-26T13:12:44Z Starting analysis with Sysdig scanner version 1.2.6-rc
2022-08-26T13:12:44Z Retrieving vulnerabilities DB...
2022-08-26T13:12:45Z Done 99.0 MB
2022-08-26T13:12:45Z Loading vulnerabilities DB...
2022-08-26T13:12:45Z Done
2022-08-26T13:12:45Z Retrieving image...
ERRO[0001] Failed to built-in GetDriver graph btrfs /var/lib/containers/storage
2022-08-26T13:12:56Z Done
2022-08-26T13:12:56Z Scan started...
2022-08-26T13:13:06Z Uploading result to backend...
2022-08-26T13:13:06Z Done
2022-08-26T13:13:06Z Total execution time 21.915106926s

Type: dockerImage
ImageID: sha256:b670c067178c876d17363baec279d483ae07384351d1a0be7646230442471ac6
Digest: sysdiglabs/dummy-vuln-app@sha256:bc86e8ba5741ab71ce50f13fbf89a1f27dc4e1d3b0c3345cee8e3238bc30022b
BaseOS: debian 9.13
PullString: sysdiglabs/dummy-vuln-app

12 vulnerabilities found
1 Critical (0 fixable)
5 High (2 fixable)
6 Medium (5 fixable)
0 Low (0 fixable)
0 Negligible (0 fixable)

  PACKAGE   TYPE   VERSION  SUGGESTED FIX  CRITICAL  HIGH  MEDIUM  LOW  NEGLIGIBLE  EXPLOIT
  pip      python   9.0.1       19.2          0       2      1      0       0          0
  numpy    python  1.12.1      1.19.0         0       1      3      0       0          0
  pyxdg    python   0.25        0.26          0       1      0      0       0          0
  Jinja2   python  2.11.2      2.11.3         0       0      1      0       0          0

                  POLICIES EVALUATION
    Policy: Sysdig Best Practices FAILED (7 failures)

Policies evaluation FAILED at 2022-08-26T13:13:06Z
Full image results here: https://eu1.app.sysdig.com/secure/#/scanning/assets/results/xxxx/overview (id xxxx)
Execution logs written to: /scan-logs
```

