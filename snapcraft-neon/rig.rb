#!/usr/bin/env ruby
# frozen_string_literal: true
#
# Copyright (C) 2016 Harald Sitter <sitter@kde.org>
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) version 3, or any
# later version accepted by the membership of KDE e.V. (or its
# successor approved by the membership of KDE e.V.), which shall
# act as a proxy defined in Section 6 of version 3 of the license.
#
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with this library.  If not, see <http://www.gnu.org/licenses/>.

require '/var/lib/jenkins/ci-tooling/nci/lib/setup_repo.rb'

NCI.setup_repo!
Apt.install('snapcraft', 'appstream', 'gir1.2-appstream',
            'libappstream-dev', 'libgirepository1.0-dev',
            'zsync') || raise
Apt.update || raise
system('gem install gir_ffi') || raise

# Switch into main script now that deps are set up
exec('./internal.rb')
