# fj-lambdapipeline

Artifacts buckets:
sit = arn:aws:s3:::codepipeline-eu-west-1-136679055017


Codebuild:
- need to add ENV vars
- add AWS secrets policy


Things to think about:
- Custom block/module to provide additional environment vars for codebuild 
- Global vars module - replace hardcoded workspace name from the variables
  - Add local to strip off the prefix of env
- Codepipeline - local block for stages - can it be optimised in any sense?



env         = substr(local.name_prefix, 3, length(local.name_prefix))


