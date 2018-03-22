# Makefile for x11guidemo

.PHONY: all clean

TESTS = client_xaw client_forms client_w client_xv client_glfw

# client_xaw test
CLIENT_XAW_SRC = client_xaw.c
CLIENT_XAW_DEP = $(CLIENT_XAW_SRC:.c=.d)
CLIENT_XAW_OBJ = $(CLIENT_XAW_SRC:.c=.o)

# client_forms test
CLIENT_FORMS_SRC = client_forms.c
CLIENT_FORMS_DEP = $(CLIENT_FORMS_SRC:.c=.d)
CLIENT_FORMS_OBJ = $(CLIENT_FORMS_SRC:.c=.o)

# client_w test
CLIENT_W_SRC = client_w.c
CLIENT_W_DEP = $(CLIENT_W_SRC:.c=.d)
CLIENT_W_OBJ = $(CLIENT_W_SRC:.c=.o)

# client_xv test
CLIENT_XV_SRC = client_xv.c
CLIENT_XV_DEP = $(CLIENT_XV_SRC:.c=.d)
CLIENT_XV_OBJ = $(CLIENT_XV_SRC:.c=.o)

# client_glfw test
CLIENT_GLFW_SRC = client_glfw.c
CLIENT_GLFW_DEP = $(CLIENT_GLFW_SRC:.c=.d)
CLIENT_GLFW_OBJ = $(CLIENT_GLFW_SRC:.c=.o)

CFLAGS = -Wall -W -g

all: $(TESTS)

client_xaw: $(CLIENT_XAW_OBJ)
	$(CC) $(CFLAGS) -o $@ $(CLIENT_XAW_OBJ) -lXaw -lXt -lX11

client_xaw.o:
	$(CC) $(CFLAGS) -c $(CLIENT_XAW_SRC) -o $@

client_forms: $(CLIENT_FORMS_OBJ)
	$(CC) $(CFLAGS) -o $@ $(CLIENT_FORMS_OBJ) -lforms

client_forms.o:
	$(CC) $(CFLAGS) -c $(CLIENT_FORMS_SRC) -o $@

client_w: $(CLIENT_W_OBJ)
	$(CC) $(CFLAGS) -o $@ $(CLIENT_W_OBJ) -lWINGs -lwraster -lX11 -lfontconfig -lXft

client_w.o:
	$(CC) $(CFLAGS) -c $(CLIENT_W_SRC) -o $@

client_xv: $(CLIENT_XV_OBJ)
	$(CC) $(CFLAGS) -o $@ $(CLIENT_XV_OBJ) -lxview

client_xv.o:
	$(CC) $(CFLAGS) -c $(CLIENT_XV_SRC) -o $@

client_glfw: $(CLIENT_GLFW_OBJ)
	$(CC) $(CFLAGS) -o $@ $(CLIENT_GLFW_OBJ) -lglfw

client_glfw.o:
	$(CC) $(CFLAGS) -c $(CLIENT_GLFW_SRC) -o $@

#client_xv : client_xv.c
#client_xv : LDLIBS = -lxview
#clean :: ; $(RM) client_xv
#all :: client_xv

#client_glfw : client_glfw.c
#client_glfw : LDLIBS = -lglfw
#clean :: ; $(RM) client_glfw
#all :: client_glfw
