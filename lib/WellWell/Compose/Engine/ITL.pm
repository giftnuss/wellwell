# WellWell::Compose::Engine::ITL - ITL composing engine for WellWell
#
# Copyright (C) 2010 Stefan Hornburg (Racke) <racke@linuxia.de>.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public
# License along with this program; if not, write to the Free
# Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
# MA 02110-1301, USA.

package WellWell::Compose::Engine::ITL;

use strict;
use warnings;

use Vend::Tags;

use WellWell::Core qw/plugin_search_component/;
use WellWell::Compose::Component::ITL;

sub new {
	my ($class) = @_;
	my $self = {};

	bless $self;

	return $self;
}

sub locate_component {
	my ($self, $name) = @_;
	my ($directory, $component, $pref);
	
	if (-f "$::Variable->{MV_COMPONENT_DIR}/$name") {
		$directory = $::Variable->{MV_COMPONENT_DIR};
	}
	elsif ($pref = plugin_search_component($name)) {
		$directory = $pref->{directory};
	}
	else {
		# component missing
		return;
	}

	$component = new WellWell::Compose::Component::ITL(file => "$::Variable->{MV_COMPONENT_DIR}/$name", name => $name);
	return $component;
}

1;

