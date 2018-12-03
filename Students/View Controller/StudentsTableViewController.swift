
import UIKit

class StudentsTableViewController: UITableViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return students.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentsCell", for: indexPath)

        cell.textLabel?.text = students[indexPath.row].name

        return cell
    }
    var students: [Student] = [] {
    didSet {
        DispatchQueue.main.async {
            self.tableView.reloadData()
    }
}
}
}
