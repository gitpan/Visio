package Visio::Master;

#PLEASE SEE MSPATENTLICENSE
# "This product may incorporate intellectual property owned by 
# Microsoft Corporation. The terms and conditions upon which Microsoft 
# is licensing such intellectual property may be found at 
# http://msdn.microsoft.com/library/en-us/odcXMLRef/html/odcXMLRefLegalNotice.asp"

# Copyright 2005 Aamer Akhter. All rights reserved.

# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:

# 1. Redistributions of source code must retain the above copyright
# notice, this list of conditions and the following disclaimer.

# 2. Redistributions in binary form must reproduce the above copyright
# notice, this list of conditions and the following disclaimer in the
# documentation and/or other materials provided with the distribution.

# THIS SOFTWARE IS PROVIDED BY THE LICENSOR(S) ``AS IS'' AND ANY EXPRESS
# OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE LICENSOR(S) OR OTHER CONTRIBUTORS BE
# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
# BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
# IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

# The views and conclusions contained in the software and documentation
# are those of the authors and should not be interpreted as representing
# official policies, either expressed or implied, of the Licensor(s).

# The software may be subject to additional license restrictions
# provided by the Licensor(s).



use 5.008;
use strict;
use warnings;
use Log::Log4perl  qw(get_logger);
use XML::LibXML;
use Carp;
use Data::Dumper;
use vars qw($VERSION);

use Visio::PageSheet;

$VERSION = sprintf "%d.%03d", q$Revision: 1.4 $ =~ /: (\d+)\.(\d+)/;

my $log = get_logger('visio.Master');

# Preloaded methods go here.

sub new {
    my $class = shift;
    my $MastersN = shift;
    my $id = shift;
    my $opts = shift;
    my $fromDom = $$opts{fromDom};
    my $self = {};
    $self->{MastersN} = $MastersN;
    $self->{xmldoc} = $MastersN->ownerDocument;
    $self->{xmlroot} = $self->{xmldoc}->documentElement;
    $self->{masterid} = $id;
    bless($self,$class);
    if (defined $fromDom) {
	$self->{masterNode} = $self->{MastersN}->appendChild($fromDom);
    }
    $self->set_id;
    $log->debug("visio Master object ($id) created");
    return $self;
}

sub set_id {
    my $self = shift;
    $self->{masterNode}->setAttribute('ID',$self->{masterid});
}

sub get_id {
    my $self = shift;
    return $self->{masterid};
}

sub set_name {
    my $self = shift;
    my $name = shift;
    $self->{masterNode}->setAttribute('Name',$name);
}

sub get_node {
    my $self = shift;
    return $self->{masterNode};
}

1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

visio - Perl extension for blah blah blah

=head1 SYNOPSIS

  use visio;
  blah blah blah

=head1 ABSTRACT

  This should be the abstract for visio.
  The abstract is used when making PPD (Perl Package Description) files.
  If you don't want an ABSTRACT you should also edit Makefile.PL to
  remove the ABSTRACT_FROM option.

=head1 DESCRIPTION

Stub documentation for visio, created by h2xs. It looks like the
author of the extension was negligent enough to leave the stub
unedited.

Blah blah blah.

=head2 EXPORT

None by default.



=head1 SEE ALSO

Mention other useful documentation such as the documentation of
related modules or operating system documentation (such as man pages
in UNIX), or any relevant external documentation such as RFCs or
standards.

If you have a mailing list set up for your module, mention it here.

If you have a web site set up for your module, mention it here.

=head1 AUTHOR

Aamer Akhter, E<lt>aakhter@localdomainE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright 2005 by Aamer Akhter

This library is free software; you can redistribute it and/or modify
it under the same terms as in LICENSE and MSPATENTLICENSE files.


=cut
