# WordPress Actions!

WordPress Actions is a collection of actions - well, for now it's just one action - to easily publish / release your plugin on WordPress.org official repository. These actions assume you're using strict [Semantic Versioning](https://semver.org/spec/v2.0.0.html) tagging for the full releases of your plugin.

To use it, you have just three mandatory steps to follow:
* __Secrets__. In your repository settings, create the secrets `SVN_USERNAME` and `SVN_PASSWORD` to store your WordPress svn username and password.
* __Assets__. By default, WordPress.org specific assets of your plugin (like icons and headers) must be in a `.wordpress-org` directory at the root of your GitHub repository.
* __Workflows__. You have to write worflows, with _yaml_, in a `.github/workflows` directory at the root of your GitHub repository.

In addition to that, you can write to the root of your repository plugin a `.gitattributes` files to exclude files from your workflows like this one:
```gitattributes
/README.md export-ignore
/.gitattributes export-ignore
/.gitignore export-ignore
/.github export-ignore
/.wordpress-org export-ignore
```

### Optional environment variables
In your _yaml_ files you can set these two environment variables:
* `SLUG` - defaults to the respository name, customizable in case your WordPress repository has a different slug.
* `ASSETS_DIR` - defaults to `.wordpress-org`, customizable for other locations of WordPress.org plugin repository-specific assets that belong in the top-level `assets` directory (the one on the same level as `trunk`).

## Deploying a plugin to the WordPress.org repository

When you want to deploy a new version of your plugin, just make a new release in GitHub. The tag value you put will lead to different behavior:
* If the tag is like `1.0.0`, it will generate a full release on WordPress.org: trunk and assets will be updated and a new `tags/1.0.0` will be created.
* If the tag is like `1.0.0-rc1`, it will generate a short release on WordPress.org: only trunk and assets will be updated. It allows, in particular, to make a "strings freeze" to let translators do their work on the "development" branch.

I suggest you to create a workflow like this to implement such behaviors:
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
          NAME: The Plugin Name
          SVN_PASSWORD: ${{ secrets.SVN_PASSWORD }}
          SVN_USERNAME: ${{ secrets.SVN_USERNAME }}
```
