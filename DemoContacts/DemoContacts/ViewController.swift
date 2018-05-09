//
//  ViewController.swift
//  DemoContacts
//
//  Created by iexm01 on 08/05/18.
//  Copyright © 2018 iExemplar. All rights reserved.
//

import UIKit
import SwiftyContacts // REF LINK : https://github.com/satishbabariya/SwiftyContacts
import Contacts

class ViewController: UIViewController {

    //MARK: - Variable Declaration
    var arrContact = NSMutableArray()
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        contactsSetup()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: - User Defined Methods
    func contactsSetup() {
        requestAccess { (responce) in
            if responce {
                print("Contacts Acess Granted")
            } else {
                print("Contacts Acess Denied")
            }
        }
        
        authorizationStatus { (status) in
            switch status {
            case .authorized:
                print("authorized")
                break
            case .denied:
                print("denied")
                break
            default:
                break
            }
        }
    }
    
    func removeSpecialCharsFromString(text: String) -> String {
        let okayChars : Set<Character> =
            Set("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ")
        return String(text.filter {okayChars.contains($0) })
    }

    //MARK: - IBAction
    @IBAction func contact_Action(sender: UIButton) {
        switch sender.tag {
        case 0: // fetch contact
            /*
             <CNContact: 0x7fcb52409820: identifier=177C371E-701D-42F8-A03B-C61CA31627F6, givenName=Kate, familyName=Bell, organizationName=Creative Consulting, phoneNumbers=(
             "<CNLabeledValue: 0x604000466440: identifier=EF48385D-28C2-48DE-AAB3-A81BC5F16981, label=_$!<Mobile>!$_, value=<CNPhoneNumber: 0x604000423da0: stringValue=(555) 564-8583, initialCountryCode=(null)>>",
             "<CNLabeledValue: 0x604000466540: identifier=3CD5F927-B150-4104-918B-C26DD6AC811B, label=_$!<Main>!$_, value=<CNPhoneNumber: 0x604000423e20: stringValue=(415) 555-3695, initialCountryCode=(null)>>"
             ), emailAddresses=(
             "<CNLabeledValue: 0x6040004665c0: identifier=93D6F4AF-5C10-43FC-8405-A8BB02F2F9F7, label=_$!<Work>!$_, value=kate-bell@mac.com>"
             ), postalAddresses=(
             "<CNLabeledValue: 0x604000466740: identifier=8A2633AE-0400-48A4-AD83-49DBCE07CEAF, label=_$!<Work>!$_, value=<CNPostalAddress: 0x60400009e3c0: street=165 Davis Street, subLocality=, city=Hillsborough, subAdministrativeArea=, state=CA, postalCode=94010, country=, countryCode=us>>"
             )>
             */
            fetchContacts(completionHandler: { (result) in
                switch result {
                case .Success(response: let contacts):
                    print(contacts)
                    print(contacts.count)
                    for index in 0..<(contacts.count) {
                        let dict = NSMutableDictionary()
                        dict.setValue(contacts[index].givenName, forKey: "Name")
                        dict.setValue(contacts[index].familyName, forKey: "FamilyName")
                        dict.setValue(contacts[index].organizationName, forKey: "OrganisationName")
                        //                    print(dict)
                        //                    print(contacts[index].phoneNumbers.count)
                        for indexj in 0..<(contacts[index].phoneNumbers.count) {
                            print(contacts[index].phoneNumbers[indexj])
                            print(contacts[index].phoneNumbers[indexj].label as Any)
                            var strNumberLabel = contacts[index].phoneNumbers[indexj].label!
                            strNumberLabel = self.removeSpecialCharsFromString(text: strNumberLabel)
                            //                        print(strNumberLabel)
                            print(contacts[index].phoneNumbers[indexj].value.stringValue)
                            dict.setValue(contacts[index].phoneNumbers[indexj].value.stringValue as String, forKey: strNumberLabel)
                        }
                        if contacts[index].emailAddresses.count > 0 {
                            dict.setValue(contacts[index].emailAddresses[0].value as String, forKey: "EmailAddress")
                        }
                        if contacts[index].postalAddresses.count > 0 {
                            let strAddr = "\(contacts[index].postalAddresses[0].value.street), \(contacts[index].postalAddresses[0].value.city), \(contacts[index].postalAddresses[0].value.state), \(contacts[index].postalAddresses[0].value.postalCode)"
                            // \(contacts[index].postalAddresses[0].value.subLocality), \(contacts[index].postalAddresses[0].value.subAdministrativeArea)
                            dict.setValue(strAddr as String, forKey: "Address")
                            dict.setValue(contacts[index].postalAddresses[0].value.country as String, forKey: "Country")
                            dict.setValue(contacts[index].postalAddresses[0].value.isoCountryCode as String, forKey: "CountryCode")
                        }
                        print(dict)
                        self.arrContact.add(dict)
                    }
                    print("Contacts = \(self.arrContact)")
                    break
                case .Error(error: let error):
                    print(error)
                    break
                }
            })
            break
        case 1: // add new contact
            /* For Add Contacts, the Contacts header file should be included "import Contacts" */
            let contact: CNMutableContact = CNMutableContact()
            contact.givenName = "Anitha"
            // OR Use contact.mutableCopy() For Any CNContact
            
            addContact(Contact: contact) { (result) in
                switch result{
                case .Success(response: let bool):
                    if bool{
                        print("Contact Sucessfully Added")
                    }
                    break
                case .Error(error: let error):
                    print(error.localizedDescription)
                    break
                }
            }
            break
        case 2: // delete contact
            // Use contact.mutableCopy() To convert CNContact to CNMutableContact
            let contact: CNMutableContact = CNMutableContact()
            contact.givenName = "Anitha"

            deleteContact(Contact: contact) { (result) in
                switch result{
                case .Success(response: let bool):
                    if bool{
                        print("Contact Sucessfully Deleted")
                    }
                    break
                case .Error(error: let error):
                    print(error.localizedDescription)
                    break
                }
            }

            break
        default:
            break
        }
    }

}

