// ============================================================================
// Implementation Exercise: Singly Linked List
// ============================================================================
//
// -------
// Prompt:
// -------
//
// Implement a Singly Linked List and all of its methods below!
//
// ------------
// Constraints:
// ------------
//
// Make sure the time and space complexity of each is equivalent to those
// in the table provided in the Time and Space Complexity Analysis section
// of your Linked List reading!
//
// -----------
// Let's Code!
// -----------

// TODO: Implement a Linked List Node class here
class Node {
  constructor(val) {
    this.value = val;
    this.next = null;
  }
}

// TODO: Implement a Singly Linked List class here
class LinkedList {
  constructor() {
    this.head = null;
    this.tail = null;
    this.length = 0;
  }

  // TODO: Implement the addToTail method here
  addToTail(val) {
    const tmp = new Node(val);
    if (!this.head) {
      this.head = tmp;
    } else {
      this.tail.next = tmp;
    }
    this.tail = tmp;
    this.length++;
    return this;
  }

  // TODO: Implement the removeTail method here
  removeTail() {
    if (!this.head) return undefined;
    let currNode = this.head;
    while (currNode.next) {
      this.tail = currNode;
      currNode = currNode.next;
    }
    this.tail.next = null;
    this.length--;
    if (this.length === 0) {
      this.head = this.tail = null;
    }
    return currNode;
  }

  // TODO: Implement the addToHead method here
  addToHead(val) {
    const tmp = new Node(val);
    if (!this.head) {
      this.tail = tmp;
    } else {
      tmp.next = this.head;
    }
    this.head = tmp;
    this.length++;
    return this;
  }

  // TODO: Implement the removeHead method here
  removeHead() {
    if (!this.head) return undefined;
    const node = this.head;
    this.head = this.head.next;
    this.length--;
    if (this.length === 0) {
      this.head = this.tail = null;
    }
    return node;
  }

  // TODO: Implement the contains method here
  contains(target) {
    let currNode = this.head;
    while (currNode) {
      if (currNode.value === target) return true;
      currNode = currNode.next;
    }
    return false;
  }

  // TODO: Implement the get method here
  get(index) {
    if (index >= this.length || index < 0) return null;
    let currNode = this.head;
    while (index) {
      currNode = currNode.next;
      index--;
    }
    return currNode;
  }

  // TODO: Implement the set method here
  set(index, val) {
    const currNode = this.get(index);
    if (currNode) {
      currNode.value = val;
      return true;
    } else {
      return false;
    }
  }

  // TODO: Implement the insert method here
  insert(index, val) {
    if (index >= this.length || index < 0) return false;
    if (index === 0) {
      this.addToHead(val);
    } else if (index === this.length) {
      this.addToTail(val);
    } else {
      const prevNode = this.get(index - 1);
      const currNode = prevNode.next;
      const newNode = new Node(val);
      prevNode.next = newNode;
      newNode.next = currNode;
      this.length++;
    }
    return true;
  }

  // TODO: Implement the remove method here
  remove(index) {
    if (index >= this.length || index < 0) return undefined;
    let removedNode;
    if (index === 0) {
      removedNode = this.removeHead();
    } else if (index === this.length - 1) {
      removedNode = this.removeTail();
    } else {
      const prevNode = this.get(index - 1);
      removedNode = prevNode.next;
      prevNode.next = prevNode.next.next;
      this.length--;
    }
    return removedNode;
  }

  // TODO: Implement the size method here
  size() {
    return this.length;
  }
}

exports.Node = Node;
exports.LinkedList = LinkedList;
