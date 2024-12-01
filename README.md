# gei demo
A demo repo for gei

## pre-requisites
- ensure migrations are enabled in GHES
- create **classic** PAT tokens which meet [requirements](https://docs.github.com/en/enterprise-server@3.13/migrations/using-github-enterprise-importer/migrating-between-github-products/managing-access-for-a-migration-between-github-products#required-scopes-for-personal-access-tokens)
- either set variables in a .env file and set them with `set -o allexport; source .env; set +o allexport` or export them in your shell


## bootstrap
You can bootstrap this script on mac using the following command:
```bash
./scripts/bootstrap.sh
```

## Analysis before you migrate
- [gh-repo-stats](https://github.com/mona-actions/gh-repo-stats/) (last push date, repo size, empty repo)
- [git-sizer](https://github.com/github/git-sizer#getting-started)
- [timrogers/gh-migration-audit](https://github.com/timrogers/gh-migration-audit) (identify un-migratable data) - not an official GitHub tool but great insights
- [GitHub Migration Analyzer](https://github.com/github/gh-migration-analyzer) – org metrics, repo metrics
- [Dry run migrations with GEI](https://docs.github.com/en/migrations/using-github-enterprise-importer/migrating-between-github-products/overview-of-a-migration-between-github-products#running-your-migrations) – uncover problems early
- [Stale repos](https://github.com/github/stale-repos) (GitHub Action)
- [Repository reports](https://docs.github.com/en/enterprise-server@3.12/admin/monitoring-activity-in-your-enterprise/exploring-user-activity-in-your-enterprise/accessing-reports-for-your-instance#repository-reports) (owner name, repo size, visibility)


## Migrate a single repository from GitHub Enterprise Server to GitHub Enterprise Cloud
```bash
gh gei migrate-repo --github-source-org $GH_SOURCE_ORG --source-repo $GH_SOURCE_REPO \
--github-target-org $GH_DESTINATION_ORG \
--target-repo $GH_DESTINATION_REPO \
--ghes-api-url $GHES_API_URL
```

## Migrate an organization from GHEC to GHEC EMU
```bash
gh gei migrate-org --github-source-org SOURCE \
--github-target-org DESTINATION \
--github-target-enterprise ENTERPRISE
```
## Example output from tools
- [GEI migration logs GHEC to EMU](./examples/gei-output/)
- [GEI mannequin](./examples/gei-output/our-ghec-org1-migrated-mannequin.csv)
- [gh-repo-stats](./examples/gh-repo-stats/)
- [gh-migration-audit](./examples/gh-migration-audit/gitstua-labs-migration-audit.csv) - NOT AN OFFICIAL TOOL


## Thanks
- official docs
https://docs.github.com/en/migrations/using-github-enterprise-importer/migrating-repositories-with-github-enterprise-importer/migrating-repositories-from-github-enterprise-server-to-github-enterprise-cloud
- shared Gist https://gist.github.com/mihow/9c7f559807069a03e302605691f85572
