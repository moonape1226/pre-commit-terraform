# Collection of pre-commit hooks used for Terraform

[![Github tag](https://img.shields.io/github/tag/moonape1226/pre-commit-terraform.svg)](https://github.com/moonape1226/pre-commit-terraform/releases) ![](https://img.shields.io/maintenance/yes/2021.svg)

## Install

### Requirement

Please follow the [instruction](https://pre-commit.com/#install) to install pre-commit first

### Add configs and hooks

Under the repository you want to have the pre-commit hooks installed and run:

```bash
git init
cat <<EOF > .pre-commit-config.yaml
repos:
- repo: git://github.com/moonape1226/pre-commit-terraform
  rev: <VERSION> # Get the latest from: https://github.com/moonape1226/pre-commit-terraform/releases
  hooks:
    - id: managed_tag_check
EOF
```

### Run

After pre-commit hook has been installed you can run it manually on all files in the repository

```bash
pre-commit run -a
```

## Available Hooks

| Hook name | Description |
| --- | --- |
| `managed_tag_check` | Check Terraform source has tag `"Managed" = "Terraform"`. |

Check the [source file](https://github.com/moonape1226/pre-commit-terraform/blob/master/.pre-commit-hooks.yaml) to know arguments used for each hook.

## License

MIT licensed. See LICENSE for full details.
