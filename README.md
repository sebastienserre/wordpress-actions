# WordPress Actions!

Here is a collection of GitHub Actions to help with common needs for WordPress development. Specific documentation for each Action is in the `README.md` file in its subdirectory.


## Deploying a plugin to the WordPress.org repository

When you want to deploy a new version of your plugin, just make a new release in GitHub. The tag value you put will lead to different behavior:
* If the tag is like `1.0.0`, it will generate a full release on WordPress.org: trunk and assets will be updated and a new `tags/1.0.0` will be created.
* If the tag is like `1.0.0-rc1`, it will generate a short release on WordPress.org: only trunk and assets will be updated. It allows, in particular, to make a "strings freeze" to let translators do their work on the "development" branch.

I suggest you to create a workflow like this to implement such a behavior:

```yml
name: New WordPress.org release

on:
  release:
    branches:
      - refs/tags/*

jobs:
  tag:
    name: New tag
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@master
      - name: WordPress Plugin Deploy
        uses: Pierre-Lannoy/wordpress-actions/dotorg-plugin-deploy@master
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
          SLUG: the-plugin-slug
          SVN_PASSWORD: ${{ secrets.SVN_PASSWORD }}
          SVN_USERNAME: ${{ secrets.SVN_USERNAME }}
```
