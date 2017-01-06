/* This file is part of Kairo Timer

   Copyright 2016 Kevin Ottens <ervin@kde.org>

   This program is free software; you can redistribute it and/or
   modify it under the terms of the GNU General Public License as
   published by the Free Software Foundation; either version 2 of
   the License or (at your option) version 3 or any later version
   accepted by the membership of KDE e.V. (or its successor approved
   by the membership of KDE e.V.), which shall act as a proxy
   defined in Section 14 of version 3 of the license.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301,
   USA.
*/

import QtQuick 2.0
import Kairo 1.0

import org.kde.kirigami 2.0 as Kirigami


Kirigami.ApplicationWindow {
    id: root
    visible: true
    width: 640
    height: 480

    property bool displayListPage: true

    CircuitListPage {
        id: list
        width: parent.width
        height: parent.height
        anchors.top: parent.top

        x: root.displayListPage ? 0 : -width

        onCircuitSelected: {
            displayListPage = false
            control.model = circuit
        }

        Behavior on x {
            SequentialAnimation {
                NumberAnimation { duration: 200 }
                ScriptAction { script: control.start() }
            }
        }
    }

    CircuitControlPage {
        id: control
        width: parent.width
        height: parent.height
        anchors.top: parent.top
        anchors.left: list.right

        onCircuitFinished: root.displayListPage = true
    }
}
