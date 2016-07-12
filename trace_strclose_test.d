

#pragma D option flowindent

fbt::strclose:entry
/execname == "test"/
{
	self->follow = 1;
}

fbt::strclose:return
/self->follow/
{
	self->follow = 0;
}

fbt:::
/self->follow/
{

}
