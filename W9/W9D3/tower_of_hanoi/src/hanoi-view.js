class HanoiView {
    constructor(game, rootEl) {
        this.game = game;
        this.root = rootEl;
        this.ivar;
        
        this.setupTowers();
        this.render();
        this.clickTower();
    }

    setupTowers() {
        // const $piles = $("<ul></ul>").addClass("piles");
        // this.root.append($piles);
        for (let i = 0; i < 3; i++) {
            let $pile = $("<ul></ul>")
                .addClass(`pile-${i} pile`)
                .data({ idx: i });
            this.root.append($pile);
        }
    }

    render() {
        $(".disc").remove();
        this.game.towers.forEach((pile, pileIdx) =>
            pile
                .slice()
                .reverse()
                .forEach((disc) => {
                    let $disc = $("<li></li>")
                        .addClass(`disc-${disc} disc`)
                        .data({ idx: disc });
                    $(`.pile-${pileIdx}`).append($disc);
                })
        );
    }

    clickTower() {
        const that = this;
        this.root.on("click", "ul", function (event) {
            if (that.ivar === undefined) {
                that.ivar = $(event.currentTarget).data().idx;
            } else {
                let response = that.game.move(
                    that.ivar,
                    $(event.currentTarget).data().idx
                );
                if (response) {
                    that.render();
                } else {
                    alert("False move");
                }
                that.ivar = undefined;
            }
        });
    }
}

module.exports = HanoiView;
