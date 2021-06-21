#include <stdlib.h>
#include <X11/Intrinsic.h>
#include <X11/Shell.h>
#include <X11/StringDefs.h>

static XtAppContext appcontext;

void act_quit(Widget w, XEvent *event, String *params, Cardinal *num_params)
{
	XtUnmapWidget(w);
	XtDestroyApplicationContext(appcontext);
	exit(1);
}

int main(int argc, char **argv)
{
	XrmOptionDescRec optlist[0] = { };
	Widget top;
	Atom wm_delete_window;
	XtActionsRec actions[1] = {
		{ "quit", act_quit },
	};

	top = XtVaOpenApplication(&appcontext, "Client",
		optlist, XtNumber(optlist),
		&argc, argv, NULL, applicationShellWidgetClass,
		XtNwidth, 600, XtNheight, 600, "title", "Hello World", NULL);

	XtAppAddActions(appcontext, actions, XtNumber(actions));

	// Indicate that when "top" receives the ClientMessage X11 event,
	// WM_PROTOCOLS type we should invoke the "quit" action, which is
	// actually mapped to "act_quit".
	XtOverrideTranslations(top,
		XtParseTranslationTable("<Message>WM_PROTOCOLS: quit()"));

	XtRealizeWidget(top);

	// Specify that atoms that this window is going to handle, in this case we
	// only interested in the WM_DELETE_WINDOW property.
	wm_delete_window = XInternAtom(XtDisplay(top), "WM_DELETE_WINDOW", False);
	XSetWMProtocols(XtDisplay(top), XtWindow(top), &wm_delete_window, 1);

	XtAppMainLoop(appcontext);
	return 0;
}
