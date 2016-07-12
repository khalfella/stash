
#pragma D option flowindent

syscall::gtime:entry
/pid == $target/
{
	self->follow = 1;
}

fbt:::
/self->follow/
{
}


syscall::gtime:return
/self->follow/
{
	self->follow = 0;
}
