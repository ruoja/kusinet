xdescribe("Template", function() {
	var navigation;
	
	beforeEach(function() {
		navigation = new Navigation();
		navigation.initNavigation();
		});
	
	it("should include all elements", function() {
		expect(navElements).toContain('members');
		//expect(navElements).toContain('spots');
		//expect(navElements).toContain('gallery');
		//expect(navElements).toContain('forum');
		//expect(navElements).not.toContain('');
		});
	});