//
//  Connector.swift
//  UDF
//
//  Created by Anton Goncharov on 06.10.2020.
//
//  Copyright 2021  Suol Innovations Ltd.
//  THE SOFTWARE IS PROVIDED UNDER THE TERMS OF THIS LICENSE. ANY USE, REPRODUCTION OR DISTRIBUTION OF THE SOFTWARE CONSTITUTES RECIPIENT'S ACCEPTANCE OF THIS LICENSE.
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions of this License.
//  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//  This Software is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
//
//  1. DEFINITIONS
//  “Contribution” means:
//  a) in the case of the initial Contributor, the initial content Distributed under this LICENSE, and
//  b) in the case of each subsequent Contributor:
//  i) changes to the Software, and
//  ii) additions to the Software;
//  where such changes and/or additions to the Software originate from and are Distributed by that particular Contributor. A Contribution “originates” from a Contributor if it was added to the Software by such Contributor itself or anyone acting on such Contributor's behalf. Contributions do not include changes or additions to the Software that are not Modified Works.
//
//  “Contributor” means any person or entity that Distributes the Software.
//
//  “Software” means the Contributions Distributed in accordance with this License.
//
//  “Recipient” means anyone who receives the Software under this License or any Secondary License (as applicable), including Contributors.
//
//  “Derivative Works” shall mean any work, whether in Source Code or other form, that is based on (or derived from) the Software and for which the editorial revisions, annotations, elaborations, or other modifications represent, as a whole, an original work of authorship.
//
//  “Modified Works” shall mean any work in Source Code or other form that results from an addition to, deletion from, or modification of the contents of the Software, including, for purposes of clarity any new file in Source Code form that contains any contents of the Software. Modified Works shall not include works that contain only declarations, interfaces, types, classes, structures, or files of the Software solely in each case in order to link to, bind by name, or subclass the Software or Modified Works thereof.
//
//  “Distribute” means the acts of a) distributing or b) making available in any manner that enables the transfer of a copy.
//
//  “Source Code” means the form of a Software preferred for making modifications, including but not limited to software source code, documentation source, and configuration files.
//
//  “Secondary License” means either the MIT license, or any later versions of that license, including any exceptions or additional permissions as identified by the initial Contributor.
//
//  2. GRANT OF RIGHTS
//  a) Subject to the terms of this License, each Contributor hereby grants Recipient a non-exclusive, worldwide, royalty-free copyright license to reproduce, prepare Derivative Works of, publicly display, publicly perform, Distribute and sublicense the Contribution of such Contributor, if any, and such Derivative Works.
//  b) Recipient understands that although each Contributor grants the licenses to its Contributions set forth herein, no assurances are provided by any Contributor that the Software does not infringe the patent or other intellectual property rights of any other entity. Each Contributor disclaims any liability to Recipient for claims brought by any other entity based on infringement of intellectual property rights or otherwise. As a condition to exercising the rights and licenses granted hereunder, each Recipient hereby assumes sole responsibility to secure any other intellectual property rights needed, if any. For example, if a third party patent license is required to allow Recipient to Distribute the Software, it is Recipient's responsibility to acquire that license before distributing the Software.
//  d) Each Contributor represents that to its knowledge it has sufficient copyright rights in its Contribution, if any, to grant the copyright license set forth in this License.
//  e) Notwithstanding the terms of any Secondary License, no Contributor makes additional grants to any Recipient (other than those set forth in this Agreement) as a result of such Recipient's receipt of the Program under the terms of a Secondary License (if permitted under the terms of Section 3).
//
//  3. REQUIREMENTS
//  3.1 If a Contributor Distributes the Software in any form, then:
//  a) the Program must also be made available as Source Code, in accordance with section 3.2, and the Contributor must accompany the Software with a statement that the Source Code for the Software is available under this License, and informs Recipients how to obtain it in a reasonable manner on or through a medium customarily used for software exchange; and
//  b) the Contributor may Distribute the Software under a license different than this License, provided that such license:
//  i) effectively disclaims on behalf of all other Contributors all warranties and conditions, express and implied, including warranties or conditions of title and non-infringement, and implied warranties or conditions of merchantability and fitness for a particular purpose;
//  ii) effectively excludes on behalf of all other Contributors all liability for damages, including direct, indirect, special, incidental and consequential damages, such as lost profits;
//  iii) does not attempt to limit or alter the recipients' rights in the Source Code under section 3.2; and
//  iv) requires any subsequent distribution of the Software by any party to be under a license that satisfies the requirements of this section 3.
//  3.2 When the Software is Distributed as Source Code:
//  a) it must be made available under this Agreement, or if the Program (i) is combined with other material in a separate file or files made available under a Secondary License, and (ii) the initial Contributor attached to the Source Code the notice described in Exhibit A of this Agreement, then the Program may be made available under the terms of such Secondary Licenses, and
//  b) a copy of this Agreement must be included with each copy of the Program.
//  3.3 Contributors may not remove or alter any copyright, patent, trademark, attribution notices, disclaimers of warranty, or limitations of liability (‘notices’) contained within the Program from any copy of the Program which they Distribute, provided that Contributors may add their own appropriate notices.
//
//  4. COMMERCIAL DISTRIBUTION
//  Commercial distributors of Software may accept certain responsibilities with respect to end users, business partners and the like. While this license is intended to facilitate the commercial use of the Software, the Contributor who includes the Software in a commercial product offering should do so in a manner which does not create potential liability for other Contributors. Therefore, if a Contributor includes the Software in a commercial product offering, such Contributor (“Commercial Contributor”) hereby agrees to defend and indemnify every other Contributor (“Indemnified Contributor”) against any losses, damages and costs (collectively “Losses”) arising from claims, lawsuits and other legal actions brought by a third party against the Indemnified Contributor to the extent caused by the acts or omissions of such Commercial Contributor in connection with its distribution of the Software in a commercial product offering. The obligations in this section do not apply to any claims or Losses relating to any actual or alleged intellectual property infringement. In order to qualify, an Indemnified Contributor must: a) promptly notify the Commercial Contributor in writing of such claim, and b) allow the Commercial Contributor to control, and cooperate with the Commercial Contributor in, the defense and any related settlement negotiations. The Indemnified Contributor may participate in any such claim at its own expense.
//
//  5. NO WARRANTY
//  EXCEPT AS EXPRESSLY SET FORTH IN THIS AGREEMENT, AND TO THE EXTENT PERMITTED BY APPLICABLE LAW, THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//  Each Recipient is solely responsible for determining the appropriateness of using and distributing the Program and assumes all risks associated with its exercise of rights under this License, including but not limited to the risks and costs of program errors, compliance with applicable laws, damage to or loss of data, programs or equipment, and unavailability or interruption of operations.
//
//  If the disclaimer of warranty and limitation of liability provided above cannot be given local legal effect according to their terms, reviewing courts shall apply local law that most closely approximates an absolute waiver of all civil liability in connection with the Program, unless a warranty or assumption of liability accompanies a copy of the Program in return for a fee.
//
//  6. DISCLAIMER OF LIABILITY
//  EXCEPT AS EXPRESSLY SET FORTH IN THIS AGREEMENT, AND TO THE EXTENT PERMITTED BY APPLICABLE LAW, NEITHER RECIPIENT NOR ANY CONTRIBUTORS SHALL HAVE ANY LIABILITY FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING WITHOUT LIMITATION LOST PROFITS), HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OR DISTRIBUTION OF THE PROGRAM OR THE EXERCISE OF ANY RIGHTS GRANTED HEREUNDER, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.

/// A protocol that allows you to connect a ``Component`` to a ``Store``
/// You can use it as an alternative to stateToProps closure.
public protocol Connector: Mapper { }
