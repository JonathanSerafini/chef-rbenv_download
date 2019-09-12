# Abandoned Project

**NOTE**: This project is no longer being maintained.

# ruby_rbenv_download cookbook

## Description

A cookbook providing the `ruby_rbenv_download` LWRP which provides the `ruby_rbenv` cookbook the ability to install pre-compiled ruby binaries from the RVM repositories.

## Requirements

### Chef

This cookbook requires Chef 12.5+.

### Cookbooks

* ruby_rbenv

## Resources and Providers

### ruby_rbenv_download

This resource downloads a pre-compiled ruby binary and optionally sets it as the global ruby.

#### Actions

<table>
  <thead>
    <tr>
      <th>Action</th>
      <th>Description</th>
      <th>Default</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>install</td>
      <td>
        Downloads a pre-compiled ruby binary from `rvm` and installs it.
      </td>
      <td>Yes</td>
    </tr>
  </tbody>
</table>

#### Attributes

<table>
  <thead>
    <tr>
      <th>Attribute</th>
      <th>Description</th>
      <th>Default Value</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>rbenv_version</td>
      <td>
        <b>Name attribute:</b> the version of ruby to download
      </td>
      <td><code>nil</code></td>
    </tr>
    <tr>
      <td>root_path</td>
      <td>
        The path prefix to rbenv installation, for example:
        <code>/opt/rbenv</code>.
      </td>
      <td><code>nil</code></td>
    </tr>
    <tr>
      <td>user</td>
      <td>
        A users's isolated rbenv installation on which to apply an action. The
        default value of <code>nil</code> denotes a system-wide rbenv
        installation is being targeted. <b>Note:</b> if specified, the user
        must already exist.
      </td>
      <td><code>nil</code></td>
    </tr>
    <tr>
      <td>environment</td>
      <td>
        A has of environment variables to set before running this command.
      </td>
      <td><code>nil</code></td>
    </tr>
    <tr>
			<td>global</td>
      <td>
				A boolean determining whether a `rbenv_global` resource should be
				created.
			</td>
			<td><code>false</code></td>
    </tr>
	</tbody>
</table>

#### Examples

##### Install Ruby 2.1.5

  ruby_rbenv_download "2.1.5" do
    action :install
  end

