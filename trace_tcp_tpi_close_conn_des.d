BEGIN {
	q  = (queue_t *)NULL;
}


fbt::tcp_tpi_close:entry
/execname == "test02"/
{
	q = (queue_t *) arg0;
	self->conn = (conn_t *) q->q_ptr;
	conn = self->conn;
}

fbt::tcp_tpi_close:return
/self->conn/
{
	print(self->conn);
	print(*self->conn);
	stack();
	self->conn = 0;
}

fbt::ipcl_conn_destroy:entry
/conn == (conn_t *)arg0/
{
	printf("caught it, came here to destroy it here\n");
	printf("pid = %d, execname = %s\n", pid, execname);
	stack();

	chill(500000000);
	self->chill_me  = 1;

}


fbt::ipcl_conn_destroy:entry
/self->chill_me/
{
	chill(500000000);
}
fbt::ipcl_conn_destroy:entry
/self->chill_me/
{
	chill(500000000);
}
fbt::ipcl_conn_destroy:entry
/self->chill_me/
{
	chill(500000000);
}

fbt::ipcl_conn_destroy:entry
/self->chill_me/
{
	chill(500000000);
}


fbt::ipcl_conn_destroy:return
/self->chill_me/
{
	self->chill_me = 0;
	printf("out of destroy....\n");
}

