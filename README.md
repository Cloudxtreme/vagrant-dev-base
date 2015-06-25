# vagrant-dev-base

 A base setup for Vagrant development in PHP 5, MariaDB and Apache.

## Installation

Clone the repository or download the ZIP file.

Run

    vagrant plugin install vagrant-hostsupdater
    vagrant plugin install vagrant-triggers

## Usage

### Configuration

All config files are set up with sane defaults. You can easily change anything to
fit your needs.

### Start

    vagrant up

Now grab a cup of coffee or tea and let the provisioner do its work.

### Stop

    vagrant halt

If you like, you can uncomment the following section in the `Vagrantfile`:

    # Vagrant triggers
    # config.trigger.before :halt, :stdout => true do
    #   info "Dumping the database before stopping the VM..."
    #   run  "vagrant ssh -c 'mysqldump -u root nzedb > /vagrant/db.sql'"
    # end
    #
    # config.trigger.before :destroy, :stdout => true do
    #   info "Dumping the database before destroying the VM..."
    #   run  "vagrant ssh -c 'mysqldump -u root nzedb > /vagrant/db.sql'"
    # end

Vagrant will then dump the database to your local file system whenever you `halt` or `destroy` the VM.
