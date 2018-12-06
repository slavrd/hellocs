control 'operating_system' do
  describe command('lsb_release -a') do
    its('stdout') { should match (/Ubuntu 16.04/) }
  end
  describe file('/opt/hellocs-ubuntu.16.04-x64/hellocs') do
    it { should exist }
    it { should be_allowed('execute') }
  end
  describe command('/opt/hellocs-ubuntu.16.04-x64/hellocs') do
    it { should exist }
    its('exit_status') { should eq 0 }
    its('stdout') { should_not eq '' }
  end
end
