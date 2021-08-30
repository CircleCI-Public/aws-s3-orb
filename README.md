# aws-s3 Orb [![CircleCI Build Status](https://circleci.com/gh/CircleCI-Public/aws-s3-orb.svg?style=shield "CircleCI Build Status")](https://circleci.com/gh/CircleCI-Public/aws-s3-orb) [![CircleCI Orb Version](https://badges.circleci.com/orbs/circleci/aws-s3.svg)](https://circleci.com/orbs/registry/orb/circleci/aws-s3) [![GitHub License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/CircleCI-Public/aws-s3-orb/master/LICENSE) [![CircleCI Community](https://img.shields.io/badge/community-CircleCI%20Discuss-343434.svg)](https://discuss.circleci.com/c/ecosystem/orbs)

  Integrate Amazon AWS S3 with your CircleCI CI/CD pipeline easily with the aws-s3 orb.


## Usage

Example use-cases are provided on the orb [registry page](https://circleci.com/orbs/registry/orb/circleci/aws-s3#usage-examples). Source for these examples can be found within the `src/examples` directory.


## Resources

[CircleCI Orb Registry Page](https://circleci.com/orbs/registry/orb/circleci/aws-s3) - The official registry page of this orb for all versions, executors, commands, and jobs described.  
[CircleCI Orb Docs](https://circleci.com/docs/2.0/orb-intro/#section=configuration) - Docs for using and creating CircleCI Orbs.  

AWS S3 Docs: https://docs.aws.amazon.com/s3/index.html

### How To Contribute

We welcome [issues](https://github.com/CircleCI-Public/aws-s3-orb/issues) to and [pull requests](https://github.com/CircleCI-Public/aws-s3-orb/pulls) against this repository!

To publish a new production version:
* Create a PR to the `Alpha` branch with your changes. This will act as a "staging" branch.
* Ensure any changes are tested by adding a new test job to your repository.
* When ready to publish a new production version, create a PR from `Alpha` to `master`. The Git Subject should include `[semver:patch|minor|release|skip]` to indicate the type of release.
* On merge, the release will be published to the orb registry automatically.

For further questions/comments about this or other orbs, visit the Orb Category of [CircleCI Discuss](https://discuss.circleci.com/c/orbs).
