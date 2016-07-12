

#pragma D option flowindent

syscall::ioctl:entry
/execname == "deadly_ioctl"/
{
	self->follow = 1;
}

syscall::ioctl:return
/self->follow/
{
	self->follow = 0;
}

fbt:::
/self->follow/
{

}
