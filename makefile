CC=gcc
CFLAGS=-W -Wall

OBJDIR=obj
OBJSERDIR=$(OBJDIR)/serveur
OBJCLIDIR=$(OBJDIR)/client
BINDIR=bin
SRCDIR=src
SRCSERDIR=$(SRCDIR)/serveur
SRCCLIDIR=$(SRCDIR)/client
TMPDIR=tmp
INCDIR=include

SRCSER=$(wildcard $(SRCSERDIR)/*.c)
SRCCLI=$(wildcard $(SRCCLIDIR)/*.c)
INC=$(wildcard $(INCDIR)/*.h)
OBJSER=$(SRCSER:$(SRCSERDIR)/%.c=$(OBJSERDIR)/%.o)
OBJCLI=$(SRCCLI:$(SRCCLIDIR)/%.c=$(OBJCLIDIR)/%.o)

EXECS=$(BINDIR)/serveur
EXECC=$(BINDIR)/client

all : $(EXECS) $(EXECC)

serveur : $(EXECS)

client : $(EXECC)

$(EXECS): $(OBJSER) $(OBJSERDIR)/*.o
	@$(CC) $^ $(CFLAGS) -o $@

$(EXECC): $(OBJCLI) $(OBJCLIDIR)/*.o
	@$(CC) $^ $(CFLAGS) -o $@

$(OBJCLIDIR)/main.o : $(INCDIR)/fonctionClient.h

$(OBJCLIDIR)/%.o : $(SRCCLIDIR)/%.c
	@$(CC) -o $@ -c $< $(CFLAGS)

$(OBJSERDIR)/main.o : $(INCDIR)/fonctionsServeur.h

$(OBJSERDIR)/%.o : $(SRCSERDIR)/%.c
	@$(CC) -o $@ -c $< $(CFLAGS)


clean:
		mv $(OBJSERDIR)/colonne.o $(TMPDIR); 
		mv $(OBJSERDIR)/fonctionsTCP.o $(TMPDIR);
		rm $(OBJSERDIR)/*.o;
		rm $(OBJCLIDIR)/*.o;
		rm -rf $(SRCDIR)/*/*.*~;
		rm -rf $(OBJDIR)/*/*.*~;
		rm -rf $(INCDIR)/*.*~;
		rm -rf ./*.*~;
		rm -rf ./*~;
		mv $(TMPDIR)/colonne.o $(OBJSERDIR); 
		mv $(TMPDIR)/fonctionsTCP.o $(OBJSERDIR);
		rm $(EXECS);
		rm $(EXECC);

cleanS :
		mv $(OBJSERDIR)/colonne.o $(TMPDIR); 
		mv $(OBJSERDIR)/fonctionsTCP.o $(TMPDIR);
		rm $(OBJSERDIR)/*.o;
		rm -rf $(SRCDIR)/*/*.*~;
		rm -rf $(OBJDIR)/*/*.*~;
		rm -rf $(INCDIR)/*.*~;
		rm -rf ./*.*~;
		rm -rf ./*~;
		mv $(TMPDIR)/colonne.o $(OBJSERDIR); 
		mv $(TMPDIR)/fonctionsTCP.o $(OBJSERDIR);
		rm $(EXECS);
		
cleanC :
		rm $(OBJCLIDIR)/*.o;
		rm -rf $(SRCDIR)/*/*.*~;
		rm -rf $(OBJDIR)/*/*.*~;
		rm -rf $(INCDIR)/*.*~;
		rm -rf ./*.*~;
		rm -rf ./*~;
		rm $(EXECC);

mvin : 
		mv $(TMPDIR)/colonne.o $(OBJSERDIR); 
		mv $(TMPDIR)/fonctionsTCP.o $(OBJSERDIR); 
