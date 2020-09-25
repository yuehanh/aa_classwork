class UsersSearch {
    constructor($ele){
        this.$element = $ele;
        this.input = $ele.find("input").eq(0).val()
        this.ul = $ele.find("ul")
    }
}