control 'aws_tests' do
    describe aws_ec2_instance(attribute('instance_id')) do
        it { should exist }
        it { should be_running }
        its('image_id') { should eq attribute('ubuntu_ami_id') }
    end
end