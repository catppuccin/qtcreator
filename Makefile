.PHONY: all install clean

flavours := latte frappe macchiato mocha
styles := $(flavours:%=styles/catppuccin-%.xml)
themes := $(flavours:%=themes/catppuccin-%.creatortheme)

all: $(styles) $(themes)

$(styles): templates/style.xml
	whiskers '$<' '$(patsubst styles/catppuccin-%.xml,%,$@)' > $@

$(themes): templates/theme.creatortheme
	whiskers '$<' '$(patsubst themes/catppuccin-%.creatortheme,%,$@)' > $@

install:
	mkdir -p ~/.config/QtProject/qtcreator/styles
	mkdir -p ~/.config/QtProject/qtcreator/themes
	cp -v styles/*.xml ~/.config/QtProject/qtcreator/styles/
	cp -v themes/*.creatortheme ~/.config/QtProject/qtcreator/themes/

clean:
	rm -fv styles/*.xml
	rm -fv themes/*.creatortheme
