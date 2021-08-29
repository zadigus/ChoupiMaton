# ChoupiMaton

## Requirements

- Qt 5.11
- latest macOS
- latest XCode

## How to compile on MacOS

- create folder ~/workspace
- install Qt in ~/workspace/Qt
- git clone this repo in ~/workspace/choupimaton
- [Generating code signing files in Xcode](https://trello.com/c/AoHSHC5R/2-application-signin)

## Troubleshooting

### Cannot git push

Sometimes, git push will not work because ssh is not working correctly on the macOS VM. To fix the issue, run 

```bash
GIT_SSH_COMMAND="ssh -o IPQoS=throughput" git push
```
