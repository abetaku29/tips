$hostname = "13.56.247.89"                     # �ڑ���z�X�g�i���ɍ��킹�ĕύX����j
$username = "Administrator"                    # �ڑ����[�U�[�i���ɍ��킹�ĕύX����j
$passwd   = "YlA.s(yxkv7rk&*InKWt-YTL?(tD)xP4" # �p�X���[�h �i���ɍ��킹�ĕύX����j

# �Z�L���A�X�g�����O�̍쐬�i�p�X���[�h�̈Í����j
$sec_str = ConvertTo-SecureString $passwd -AsPlainText -Force

# Credential �I�v�V�����Ɏw�肷��I�u�W�F�N�g�̃C���X�^���X����
$psc = New-Object System.Management.Automation.PsCredential($username, $sec_str)

# New-PSSession �R�}���h�ɂ��Z�b�V�����̐���
$sess = New-PSSession -ComputerName $hostname -Credential $psc

Get-PSSession # �Z�b�V�����̊m�F

# �R�}���h�������[�g�z�X�g��Ŏ��s����
Invoke-Command -Session $sess -ScriptBlock {Get-ExecutionPolicy;}

Remove-PSSession -Session $sess # �Z�b�V�������폜
Get-PSSession # �Z�b�V�����̊m�F
