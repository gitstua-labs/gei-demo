echo install gh-repo-stats
gh extension install mona-actions/gh-repo-stats

echo run as example (note the -p 2 -e 2 to limit the number of repos and issues to work around rate limits)
gh repo-stats --org gitstua-labs -p 2 -e 2

